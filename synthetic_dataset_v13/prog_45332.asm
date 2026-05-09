; DESCRIPTION: Composite: Renders a purple box of size 98x82 starting at (363, 99) then Draws a blue line from (108, 142) to (405, 112).
; PLAN: r0=363(x), r1=99(y), r2=98(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=108(x1), r6=142(y1), r7=405(x2), r8=112(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 363
LDI r1, 99
LDI r2, 98
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 108
LDI r6, 142
LDI r7, 405
LDI r8, 112
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
