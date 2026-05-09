; DESCRIPTION: Composite: Places a green 43x59 rectangle at position (100, 121) then Draws a blue line from (423, 108) to (263, 195).
; PLAN: r0=100(x), r1=121(y), r2=43(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=423(x1), r6=108(y1), r7=263(x2), r8=195(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 100
LDI r1, 121
LDI r2, 43
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 108
LDI r7, 263
LDI r8, 195
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
