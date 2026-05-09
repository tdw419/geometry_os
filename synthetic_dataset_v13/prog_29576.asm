; DESCRIPTION: Composite: Sets a single purple pixel at (38, 50) then Renders a black box of size 74x110 starting at (432, 99) then Draws a black line from (346, 137) to (356, 183).
; PLAN: r0=38(x), r1=50(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=432(x), r6=99(y), r7=74(width), r8=110(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=346(x1), r11=137(y1), r12=356(x2), r13=183(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 38
LDI r1, 50
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 432
LDI r6, 99
LDI r7, 74
LDI r8, 110
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 346
LDI r11, 137
LDI r12, 356
LDI r13, 183
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
