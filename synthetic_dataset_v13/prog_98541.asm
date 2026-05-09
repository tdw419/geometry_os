; DESCRIPTION: Composite: Renders a magenta line between points (416, 37) and (409, 231) then Draws a purple rectangle at (362, 154) with width 72 and height 50.
; PLAN: r0=416(x1), r1=37(y1), r2=409(x2), r3=231(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=362(x), r6=154(y), r7=72(width), r8=50(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 416
LDI r1, 37
LDI r2, 409
LDI r3, 231
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 362
LDI r6, 154
LDI r7, 72
LDI r8, 50
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
