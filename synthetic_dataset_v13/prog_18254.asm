; DESCRIPTION: Composite: Renders a cyan disk with center (191, 181) and radius 65 then Places a orange dot at position (198, 167).
; PLAN: r0=191(x), r1=181(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=198(x), r6=167(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 191
LDI r1, 181
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 198
LDI r6, 167
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
