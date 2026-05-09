; DESCRIPTION: Composite: Places a magenta line segment connecting (189, 197) to (218, 35) then Draws a black rectangle at (205, 168) with width 79 and height 31.
; PLAN: r0=189(x1), r1=197(y1), r2=218(x2), r3=35(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=205(x), r6=168(y), r7=79(width), r8=31(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 189
LDI r1, 197
LDI r2, 218
LDI r3, 35
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 168
LDI r7, 79
LDI r8, 31
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
