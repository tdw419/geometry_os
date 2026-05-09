; DESCRIPTION: Composite: Creates a orange circular shape at (51, 223) with radius 10 then Places a green 45x30 rectangle at position (52, 44) then Renders a green line between points (158, 226) and (171, 68).
; PLAN: r0=51(x), r1=223(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=52(x), r6=44(y), r7=45(width), r8=30(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=158(x1), r11=226(y1), r12=171(x2), r13=68(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 51
LDI r1, 223
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 52
LDI r6, 44
LDI r7, 45
LDI r8, 30
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 158
LDI r11, 226
LDI r12, 171
LDI r13, 68
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
