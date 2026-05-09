; DESCRIPTION: Composite: Places a purple 109x70 rectangle at position (337, 179) then Draws a blue line from (347, 204) to (334, 165).
; PLAN: r0=337(x), r1=179(y), r2=109(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=347(x1), r6=204(y1), r7=334(x2), r8=165(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 337
LDI r1, 179
LDI r2, 109
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 347
LDI r6, 204
LDI r7, 334
LDI r8, 165
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
