; DESCRIPTION: Composite: Places a orange line segment connecting (20, 59) to (46, 107) then Places a green dot at position (214, 234) then Places a white 41x60 rectangle at position (53, 159).
; PLAN: r0=20(x1), r1=59(y1), r2=46(x2), r3=107(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=214(x), r6=234(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=53(x), r11=159(y), r12=41(width), r13=60(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 20
LDI r1, 59
LDI r2, 46
LDI r3, 107
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 214
LDI r6, 234
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 53
LDI r11, 159
LDI r12, 41
LDI r13, 60
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
