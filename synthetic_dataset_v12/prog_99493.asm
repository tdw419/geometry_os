; DESCRIPTION: Composite: Places a yellow line segment connecting (40, 179) to (233, 124) then Creates a purple rectangular region at (242, 195) spanning 87 by 21 pixels.
; PLAN: r0=40(x1), r1=179(y1), r2=233(x2), r3=124(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=242(x), r6=195(y), r7=87(width), r8=21(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 40
LDI r1, 179
LDI r2, 233
LDI r3, 124
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 242
LDI r6, 195
LDI r7, 87
LDI r8, 21
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
