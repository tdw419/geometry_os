; DESCRIPTION: Composite: Renders a purple box of size 11x102 starting at (315, 60) then Draws a black line from (87, 225) to (152, 198).
; PLAN: r0=315(x), r1=60(y), r2=11(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=87(x1), r6=225(y1), r7=152(x2), r8=198(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 315
LDI r1, 60
LDI r2, 11
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 225
LDI r7, 152
LDI r8, 198
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
