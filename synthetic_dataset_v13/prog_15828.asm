; DESCRIPTION: Composite: Places a magenta 72x51 rectangle at position (269, 117) then Renders a white line between points (362, 120) and (8, 65) then Draws a cyan circle centered at (352, 82) with radius 78.
; PLAN: r0=269(x), r1=117(y), r2=72(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=362(x1), r6=120(y1), r7=8(x2), r8=65(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=352(x), r11=82(y), r12=78(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 269
LDI r1, 117
LDI r2, 72
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 362
LDI r6, 120
LDI r7, 8
LDI r8, 65
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 352
LDI r11, 82
LDI r12, 78
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
