; DESCRIPTION: Composite: Places a magenta circle of radius 14 at center (346, 136) then Renders a orange line between points (242, 87) and (58, 179).
; PLAN: r0=346(x), r1=136(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=242(x1), r6=87(y1), r7=58(x2), r8=179(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 346
LDI r1, 136
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 242
LDI r6, 87
LDI r7, 58
LDI r8, 179
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
