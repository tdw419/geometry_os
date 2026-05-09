; DESCRIPTION: Composite: Sets a single yellow pixel at (329, 195) then Draws a red line from (215, 129) to (8, 70) then Renders a black box of size 17x77 starting at (221, 88).
; PLAN: r0=329(x), r1=195(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=215(x1), r6=129(y1), r7=8(x2), r8=70(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=221(x), r11=88(y), r12=17(width), r13=77(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 329
LDI r1, 195
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 215
LDI r6, 129
LDI r7, 8
LDI r8, 70
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 221
LDI r11, 88
LDI r12, 17
LDI r13, 77
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
