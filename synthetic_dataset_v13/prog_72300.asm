; DESCRIPTION: Composite: Renders a purple box of size 108x117 starting at (99, 111) then Draws a green line from (279, 172) to (203, 16).
; PLAN: r0=99(x), r1=111(y), r2=108(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=279(x1), r6=172(y1), r7=203(x2), r8=16(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 99
LDI r1, 111
LDI r2, 108
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 279
LDI r6, 172
LDI r7, 203
LDI r8, 16
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
