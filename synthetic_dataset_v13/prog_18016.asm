; DESCRIPTION: Composite: Draws a yellow rectangle at (217, 150) with width 45 and height 13 then Draws a magenta line from (455, 195) to (279, 5).
; PLAN: r0=217(x), r1=150(y), r2=45(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=455(x1), r6=195(y1), r7=279(x2), r8=5(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 217
LDI r1, 150
LDI r2, 45
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 455
LDI r6, 195
LDI r7, 279
LDI r8, 5
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
