; DESCRIPTION: Composite: Draws a yellow line from (59, 21) to (400, 166) then Renders a black box of size 41x91 starting at (52, 127) then Sets a single red pixel at (371, 158).
; PLAN: r0=59(x1), r1=21(y1), r2=400(x2), r3=166(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=52(x), r6=127(y), r7=41(width), r8=91(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=371(x), r11=158(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 59
LDI r1, 21
LDI r2, 400
LDI r3, 166
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 52
LDI r6, 127
LDI r7, 41
LDI r8, 91
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 371
LDI r11, 158
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
