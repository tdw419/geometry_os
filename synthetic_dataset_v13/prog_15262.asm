; DESCRIPTION: Composite: Places a blue circle of radius 27 at center (209, 211) then Draws a black line from (398, 45) to (458, 137) then Renders a magenta box of size 41x12 starting at (447, 187).
; PLAN: r0=209(x), r1=211(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=398(x1), r6=45(y1), r7=458(x2), r8=137(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=447(x), r11=187(y), r12=41(width), r13=12(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 209
LDI r1, 211
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 398
LDI r6, 45
LDI r7, 458
LDI r8, 137
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 447
LDI r11, 187
LDI r12, 41
LDI r13, 12
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
