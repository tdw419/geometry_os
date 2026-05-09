; DESCRIPTION: Composite: Renders a red disk with center (173, 122) and radius 66 then Places a yellow line segment connecting (193, 60) to (314, 154).
; PLAN: r0=173(x), r1=122(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=193(x1), r6=60(y1), r7=314(x2), r8=154(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 173
LDI r1, 122
LDI r2, 66
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 193
LDI r6, 60
LDI r7, 314
LDI r8, 154
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
