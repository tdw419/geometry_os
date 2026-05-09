; DESCRIPTION: Composite: Draws a magenta rectangle at (279, 121) with width 50 and height 97 then Places a black dot at position (272, 127) then Renders a black line between points (434, 161) and (503, 180).
; PLAN: r0=279(x), r1=121(y), r2=50(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=272(x), r6=127(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=434(x1), r11=161(y1), r12=503(x2), r13=180(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 279
LDI r1, 121
LDI r2, 50
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 272
LDI r6, 127
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 434
LDI r11, 161
LDI r12, 503
LDI r13, 180
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
