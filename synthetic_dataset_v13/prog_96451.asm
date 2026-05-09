; DESCRIPTION: Composite: Places a yellow 95x13 rectangle at position (290, 173) then Draws a green line from (425, 168) to (349, 73) then Renders a orange disk with center (138, 115) and radius 53.
; PLAN: r0=290(x), r1=173(y), r2=95(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=425(x1), r6=168(y1), r7=349(x2), r8=73(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=138(x), r11=115(y), r12=53(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 290
LDI r1, 173
LDI r2, 95
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 425
LDI r6, 168
LDI r7, 349
LDI r8, 73
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 138
LDI r11, 115
LDI r12, 53
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
