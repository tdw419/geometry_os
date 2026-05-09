; DESCRIPTION: Composite: Sets a single yellow pixel at (280, 97) then Draws a black line from (262, 239) to (252, 37) then Renders a yellow box of size 54x58 starting at (393, 193).
; PLAN: r0=280(x), r1=97(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=262(x1), r6=239(y1), r7=252(x2), r8=37(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=393(x), r11=193(y), r12=54(width), r13=58(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 280
LDI r1, 97
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 262
LDI r6, 239
LDI r7, 252
LDI r8, 37
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 393
LDI r11, 193
LDI r12, 54
LDI r13, 58
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
