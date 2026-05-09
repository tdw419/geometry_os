; DESCRIPTION: Composite: Places a cyan dot at position (432, 227) then Places a cyan line segment connecting (114, 208) to (382, 204) then Renders a orange box of size 22x62 starting at (310, 131).
; PLAN: r0=432(x), r1=227(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=114(x1), r6=208(y1), r7=382(x2), r8=204(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=310(x), r11=131(y), r12=22(width), r13=62(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 432
LDI r1, 227
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 114
LDI r6, 208
LDI r7, 382
LDI r8, 204
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 310
LDI r11, 131
LDI r12, 22
LDI r13, 62
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
