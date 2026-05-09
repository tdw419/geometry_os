; DESCRIPTION: Composite: Places a purple 108x57 rectangle at position (381, 189) then Draws a purple line from (55, 229) to (56, 196).
; PLAN: r0=381(x), r1=189(y), r2=108(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=55(x1), r6=229(y1), r7=56(x2), r8=196(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 381
LDI r1, 189
LDI r2, 108
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 55
LDI r6, 229
LDI r7, 56
LDI r8, 196
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
