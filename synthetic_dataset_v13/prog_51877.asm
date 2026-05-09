; DESCRIPTION: Composite: Places a yellow 87x73 rectangle at position (329, 146) then Renders a red line between points (358, 51) and (288, 109) then Places a cyan circle of radius 11 at center (330, 234).
; PLAN: r0=329(x), r1=146(y), r2=87(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=358(x1), r6=51(y1), r7=288(x2), r8=109(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=330(x), r11=234(y), r12=11(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 329
LDI r1, 146
LDI r2, 87
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 51
LDI r7, 288
LDI r8, 109
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 330
LDI r11, 234
LDI r12, 11
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
