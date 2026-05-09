; DESCRIPTION: Composite: Creates a cyan rectangular region at (396, 210) spanning 29 by 11 pixels then Draws a blue line from (342, 231) to (128, 133).
; PLAN: r0=396(x), r1=210(y), r2=29(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=342(x1), r6=231(y1), r7=128(x2), r8=133(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 396
LDI r1, 210
LDI r2, 29
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 342
LDI r6, 231
LDI r7, 128
LDI r8, 133
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
