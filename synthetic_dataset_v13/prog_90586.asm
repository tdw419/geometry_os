; DESCRIPTION: Composite: Draws a black rectangle at (215, 181) with width 50 and height 22 then Places a white line segment connecting (411, 120) to (452, 38).
; PLAN: r0=215(x), r1=181(y), r2=50(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=411(x1), r6=120(y1), r7=452(x2), r8=38(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 215
LDI r1, 181
LDI r2, 50
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 411
LDI r6, 120
LDI r7, 452
LDI r8, 38
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
