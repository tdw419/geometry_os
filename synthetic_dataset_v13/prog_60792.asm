; DESCRIPTION: Composite: Draws a green line from (207, 27) to (276, 69) then Places a blue dot at position (389, 47) then Places a magenta 81x40 rectangle at position (168, 198).
; PLAN: r0=207(x1), r1=27(y1), r2=276(x2), r3=69(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=389(x), r6=47(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=168(x), r11=198(y), r12=81(width), r13=40(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 207
LDI r1, 27
LDI r2, 276
LDI r3, 69
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 389
LDI r6, 47
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 168
LDI r11, 198
LDI r12, 81
LDI r13, 40
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
