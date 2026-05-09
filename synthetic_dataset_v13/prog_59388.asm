; DESCRIPTION: Composite: Places a yellow line segment connecting (447, 189) to (104, 120) then Renders a purple box of size 106x106 starting at (346, 35).
; PLAN: r0=447(x1), r1=189(y1), r2=104(x2), r3=120(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=346(x), r6=35(y), r7=106(width), r8=106(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 447
LDI r1, 189
LDI r2, 104
LDI r3, 120
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 346
LDI r6, 35
LDI r7, 106
LDI r8, 106
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
