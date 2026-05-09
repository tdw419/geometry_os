; DESCRIPTION: Composite: Renders a blue box of size 102x18 starting at (167, 176) then Places a green line segment connecting (198, 163) to (475, 211).
; PLAN: r0=167(x), r1=176(y), r2=102(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=198(x1), r6=163(y1), r7=475(x2), r8=211(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 167
LDI r1, 176
LDI r2, 102
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 163
LDI r7, 475
LDI r8, 211
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
