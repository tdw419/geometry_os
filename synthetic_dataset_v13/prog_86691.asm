; DESCRIPTION: Composite: Renders a blue box of size 48x74 starting at (379, 12) then Places a green line segment connecting (81, 122) to (72, 112).
; PLAN: r0=379(x), r1=12(y), r2=48(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=81(x1), r6=122(y1), r7=72(x2), r8=112(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 379
LDI r1, 12
LDI r2, 48
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 81
LDI r6, 122
LDI r7, 72
LDI r8, 112
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
