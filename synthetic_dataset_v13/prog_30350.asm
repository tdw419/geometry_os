; DESCRIPTION: Composite: Renders a purple box of size 49x75 starting at (36, 24) then Places a white line segment connecting (431, 124) to (54, 240).
; PLAN: r0=36(x), r1=24(y), r2=49(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=431(x1), r6=124(y1), r7=54(x2), r8=240(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 36
LDI r1, 24
LDI r2, 49
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 431
LDI r6, 124
LDI r7, 54
LDI r8, 240
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
