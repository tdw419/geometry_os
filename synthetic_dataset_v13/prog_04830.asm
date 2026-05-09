; DESCRIPTION: Composite: Renders a blue box of size 53x104 starting at (355, 52) then Renders a green line between points (154, 129) and (332, 219).
; PLAN: r0=355(x), r1=52(y), r2=53(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=154(x1), r6=129(y1), r7=332(x2), r8=219(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 355
LDI r1, 52
LDI r2, 53
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 154
LDI r6, 129
LDI r7, 332
LDI r8, 219
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
