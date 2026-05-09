; DESCRIPTION: Composite: Renders a red box of size 115x44 starting at (279, 105) then Places a blue line segment connecting (370, 116) to (482, 21).
; PLAN: r0=279(x), r1=105(y), r2=115(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=370(x1), r6=116(y1), r7=482(x2), r8=21(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 279
LDI r1, 105
LDI r2, 115
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 370
LDI r6, 116
LDI r7, 482
LDI r8, 21
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
