; DESCRIPTION: Composite: Renders a orange box of size 40x95 starting at (400, 22) then Renders a black line between points (331, 245) and (237, 4).
; PLAN: r0=400(x), r1=22(y), r2=40(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=331(x1), r6=245(y1), r7=237(x2), r8=4(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 400
LDI r1, 22
LDI r2, 40
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 331
LDI r6, 245
LDI r7, 237
LDI r8, 4
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
