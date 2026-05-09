; DESCRIPTION: Composite: Places a magenta dot at position (101, 163) then Draws a yellow rectangle at (206, 42) with width 82 and height 76 then Renders a magenta line between points (501, 231) and (59, 97).
; PLAN: r0=101(x), r1=163(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=206(x), r6=42(y), r7=82(width), r8=76(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=501(x1), r11=231(y1), r12=59(x2), r13=97(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 101
LDI r1, 163
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 206
LDI r6, 42
LDI r7, 82
LDI r8, 76
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 501
LDI r11, 231
LDI r12, 59
LDI r13, 97
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
