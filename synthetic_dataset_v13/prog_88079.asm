; DESCRIPTION: Composite: Draws a blue line from (144, 154) to (136, 194) then Draws a orange rectangle at (305, 117) with width 16 and height 42 then Places a red dot at position (505, 214).
; PLAN: r0=144(x1), r1=154(y1), r2=136(x2), r3=194(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=305(x), r6=117(y), r7=16(width), r8=42(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=505(x), r11=214(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 144
LDI r1, 154
LDI r2, 136
LDI r3, 194
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 305
LDI r6, 117
LDI r7, 16
LDI r8, 42
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 505
LDI r11, 214
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
