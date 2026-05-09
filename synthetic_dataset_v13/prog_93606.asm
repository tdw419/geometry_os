; DESCRIPTION: Composite: Places a blue line segment connecting (387, 172) to (328, 159) then Renders a green box of size 21x95 starting at (21, 51).
; PLAN: r0=387(x1), r1=172(y1), r2=328(x2), r3=159(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=21(x), r6=51(y), r7=21(width), r8=95(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 387
LDI r1, 172
LDI r2, 328
LDI r3, 159
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 21
LDI r6, 51
LDI r7, 21
LDI r8, 95
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
