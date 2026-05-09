; DESCRIPTION: Composite: Renders a black box of size 67x53 starting at (86, 177) then Places a black line segment connecting (252, 62) to (510, 159) then Renders a cyan disk with center (465, 156) and radius 39.
; PLAN: r0=86(x), r1=177(y), r2=67(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=252(x1), r6=62(y1), r7=510(x2), r8=159(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=465(x), r11=156(y), r12=39(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 86
LDI r1, 177
LDI r2, 67
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 252
LDI r6, 62
LDI r7, 510
LDI r8, 159
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 465
LDI r11, 156
LDI r12, 39
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
