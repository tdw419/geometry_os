; DESCRIPTION: Composite: Renders a orange box of size 19x53 starting at (206, 10) then Sets a single red pixel at (453, 41) then Renders a orange line between points (209, 24) and (20, 215).
; PLAN: r0=206(x), r1=10(y), r2=19(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=453(x), r6=41(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=209(x1), r11=24(y1), r12=20(x2), r13=215(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 206
LDI r1, 10
LDI r2, 19
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 453
LDI r6, 41
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 209
LDI r11, 24
LDI r12, 20
LDI r13, 215
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
