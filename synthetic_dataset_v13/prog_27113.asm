; DESCRIPTION: Composite: Draws a red line from (204, 96) to (341, 252) then Sets a single yellow pixel at (254, 64) then Renders a yellow box of size 50x33 starting at (168, 126).
; PLAN: r0=204(x1), r1=96(y1), r2=341(x2), r3=252(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=254(x), r6=64(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=168(x), r11=126(y), r12=50(width), r13=33(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 204
LDI r1, 96
LDI r2, 341
LDI r3, 252
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 64
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 168
LDI r11, 126
LDI r12, 50
LDI r13, 33
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
