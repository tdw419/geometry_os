; DESCRIPTION: Composite: Draws a blue rectangle at (449, 50) with width 25 and height 42 then Sets a single magenta pixel at (352, 143) then Renders a cyan line between points (181, 149) and (69, 44).
; PLAN: r0=449(x), r1=50(y), r2=25(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=352(x), r6=143(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=181(x1), r11=149(y1), r12=69(x2), r13=44(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 449
LDI r1, 50
LDI r2, 25
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 352
LDI r6, 143
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 181
LDI r11, 149
LDI r12, 69
LDI r13, 44
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
