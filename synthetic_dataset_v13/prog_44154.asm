; DESCRIPTION: Composite: Renders a black line between points (258, 194) and (248, 240) then Renders a orange box of size 104x71 starting at (159, 8).
; PLAN: r0=258(x1), r1=194(y1), r2=248(x2), r3=240(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=159(x), r6=8(y), r7=104(width), r8=71(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 258
LDI r1, 194
LDI r2, 248
LDI r3, 240
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 159
LDI r6, 8
LDI r7, 104
LDI r8, 71
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
