; DESCRIPTION: Composite: Renders a cyan disk with center (91, 171) and radius 76 then Places a black 51x50 rectangle at position (274, 125) then Places a blue dot at position (93, 247).
; PLAN: r0=91(x), r1=171(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=274(x), r6=125(y), r7=51(width), r8=50(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=93(x), r11=247(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 91
LDI r1, 171
LDI r2, 76
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 274
LDI r6, 125
LDI r7, 51
LDI r8, 50
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 93
LDI r11, 247
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
