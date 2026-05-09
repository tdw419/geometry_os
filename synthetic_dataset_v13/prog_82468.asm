; DESCRIPTION: Composite: Draws a magenta rectangle at (163, 6) with width 109 and height 17 then Draws a yellow line from (401, 33) to (221, 231).
; PLAN: r0=163(x), r1=6(y), r2=109(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=401(x1), r6=33(y1), r7=221(x2), r8=231(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 163
LDI r1, 6
LDI r2, 109
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 33
LDI r7, 221
LDI r8, 231
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
