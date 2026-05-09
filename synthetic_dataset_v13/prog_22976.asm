; DESCRIPTION: Composite: Creates a white circular shape at (247, 120) with radius 23 then Renders a blue line between points (435, 182) and (330, 212) then Places a magenta dot at position (289, 119).
; PLAN: r0=247(x), r1=120(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=435(x1), r6=182(y1), r7=330(x2), r8=212(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=289(x), r11=119(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 247
LDI r1, 120
LDI r2, 23
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 435
LDI r6, 182
LDI r7, 330
LDI r8, 212
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 289
LDI r11, 119
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
