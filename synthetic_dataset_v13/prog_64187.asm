; DESCRIPTION: Composite: Renders a cyan disk with center (185, 153) and radius 25 then Places a red 51x110 rectangle at position (152, 114).
; PLAN: r0=185(x), r1=153(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=152(x), r6=114(y), r7=51(width), r8=110(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 185
LDI r1, 153
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 152
LDI r6, 114
LDI r7, 51
LDI r8, 110
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
