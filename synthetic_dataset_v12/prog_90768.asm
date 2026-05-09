; DESCRIPTION: Composite: Creates a orange rectangular region at (236, 165) spanning 82 by 18 pixels then Sets a single purple pixel at (498, 242) then Renders a orange line between points (366, 96) and (392, 53).
; PLAN: r0=236(x), r1=165(y), r2=82(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=498(x), r6=242(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=366(x1), r11=96(y1), r12=392(x2), r13=53(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 236
LDI r1, 165
LDI r2, 82
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 498
LDI r6, 242
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 366
LDI r11, 96
LDI r12, 392
LDI r13, 53
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
