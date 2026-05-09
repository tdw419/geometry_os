; DESCRIPTION: Composite: Renders a blue box of size 64x109 starting at (283, 28) then Places a cyan line segment connecting (73, 183) to (20, 119).
; PLAN: r0=283(x), r1=28(y), r2=64(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=73(x1), r6=183(y1), r7=20(x2), r8=119(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 283
LDI r1, 28
LDI r2, 64
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 73
LDI r6, 183
LDI r7, 20
LDI r8, 119
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
