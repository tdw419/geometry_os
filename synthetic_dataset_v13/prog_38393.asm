; DESCRIPTION: Composite: Renders a red disk with center (118, 214) and radius 16 then Places a cyan dot at position (164, 117).
; PLAN: r0=118(x), r1=214(y), r2=16(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=164(x), r6=117(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 118
LDI r1, 214
LDI r2, 16
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 164
LDI r6, 117
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
