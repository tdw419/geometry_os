; DESCRIPTION: Composite: Places a blue line segment connecting (460, 77) to (274, 151) then Renders a blue box of size 75x87 starting at (1, 53).
; PLAN: r0=460(x1), r1=77(y1), r2=274(x2), r3=151(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=1(x), r6=53(y), r7=75(width), r8=87(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 460
LDI r1, 77
LDI r2, 274
LDI r3, 151
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 1
LDI r6, 53
LDI r7, 75
LDI r8, 87
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
