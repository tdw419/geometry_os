; DESCRIPTION: Composite: Renders a yellow box of size 119x19 starting at (63, 126) then Sets a single yellow pixel at (273, 51) then Renders a red line between points (440, 152) and (265, 242).
; PLAN: r0=63(x), r1=126(y), r2=119(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=273(x), r6=51(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=440(x1), r11=152(y1), r12=265(x2), r13=242(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 63
LDI r1, 126
LDI r2, 119
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 273
LDI r6, 51
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 440
LDI r11, 152
LDI r12, 265
LDI r13, 242
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
