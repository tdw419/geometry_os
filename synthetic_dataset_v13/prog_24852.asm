; DESCRIPTION: Composite: Places a white line segment connecting (175, 185) to (236, 135) then Sets a single orange pixel at (346, 72) then Renders a black box of size 67x60 starting at (229, 185).
; PLAN: r0=175(x1), r1=185(y1), r2=236(x2), r3=135(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=346(x), r6=72(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=229(x), r11=185(y), r12=67(width), r13=60(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 175
LDI r1, 185
LDI r2, 236
LDI r3, 135
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 346
LDI r6, 72
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 229
LDI r11, 185
LDI r12, 67
LDI r13, 60
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
