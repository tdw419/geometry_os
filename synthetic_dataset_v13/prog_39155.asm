; DESCRIPTION: Composite: Renders a red box of size 30x29 starting at (246, 207) then Places a black line segment connecting (176, 157) to (62, 227).
; PLAN: r0=246(x), r1=207(y), r2=30(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=176(x1), r6=157(y1), r7=62(x2), r8=227(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 246
LDI r1, 207
LDI r2, 30
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 157
LDI r7, 62
LDI r8, 227
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
