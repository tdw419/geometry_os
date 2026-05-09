; DESCRIPTION: Composite: Draws a orange line from (93, 158) to (40, 112) then Places a white dot at position (103, 168) then Places a green 113x91 rectangle at position (271, 18).
; PLAN: r0=93(x1), r1=158(y1), r2=40(x2), r3=112(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=103(x), r6=168(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=271(x), r11=18(y), r12=113(width), r13=91(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 93
LDI r1, 158
LDI r2, 40
LDI r3, 112
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 168
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 271
LDI r11, 18
LDI r12, 113
LDI r13, 91
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
