; DESCRIPTION: Composite: Places a magenta dot at position (167, 9) then Draws a yellow rectangle at (42, 8) with width 113 and height 120 then Draws a blue line from (470, 79) to (35, 227).
; PLAN: r0=167(x), r1=9(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=42(x), r6=8(y), r7=113(width), r8=120(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=470(x1), r11=79(y1), r12=35(x2), r13=227(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 167
LDI r1, 9
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 42
LDI r6, 8
LDI r7, 113
LDI r8, 120
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 470
LDI r11, 79
LDI r12, 35
LDI r13, 227
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
