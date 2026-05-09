; DESCRIPTION: Composite: Places a cyan 115x72 rectangle at position (42, 117) then Draws a purple line from (91, 171) to (151, 121) then Renders a red disk with center (108, 95) and radius 73.
; PLAN: r0=42(x), r1=117(y), r2=115(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=91(x1), r6=171(y1), r7=151(x2), r8=121(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=108(x), r11=95(y), r12=73(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 42
LDI r1, 117
LDI r2, 115
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 91
LDI r6, 171
LDI r7, 151
LDI r8, 121
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 108
LDI r11, 95
LDI r12, 73
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
