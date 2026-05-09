; DESCRIPTION: Composite: Renders a purple box of size 61x20 starting at (156, 60) then Places a yellow line segment connecting (208, 176) to (342, 153).
; PLAN: r0=156(x), r1=60(y), r2=61(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=208(x1), r6=176(y1), r7=342(x2), r8=153(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 156
LDI r1, 60
LDI r2, 61
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 208
LDI r6, 176
LDI r7, 342
LDI r8, 153
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
