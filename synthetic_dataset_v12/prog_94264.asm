; DESCRIPTION: Composite: Creates a red circular shape at (432, 125) with radius 74 then Draws a magenta line from (227, 53) to (186, 239) then Places a yellow 82x109 rectangle at position (11, 137).
; PLAN: r0=432(x), r1=125(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=227(x1), r6=53(y1), r7=186(x2), r8=239(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=11(x), r11=137(y), r12=82(width), r13=109(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 432
LDI r1, 125
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 227
LDI r6, 53
LDI r7, 186
LDI r8, 239
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 11
LDI r11, 137
LDI r12, 82
LDI r13, 109
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
