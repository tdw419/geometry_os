; DESCRIPTION: Composite: Places a yellow 35x109 rectangle at position (195, 21) then Draws a green line from (185, 111) to (423, 219).
; PLAN: r0=195(x), r1=21(y), r2=35(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=185(x1), r6=111(y1), r7=423(x2), r8=219(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 195
LDI r1, 21
LDI r2, 35
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 111
LDI r7, 423
LDI r8, 219
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
