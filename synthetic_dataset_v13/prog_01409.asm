; DESCRIPTION: Composite: Renders a black box of size 94x99 starting at (6, 127) then Draws a red line from (115, 19) to (381, 244).
; PLAN: r0=6(x), r1=127(y), r2=94(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=115(x1), r6=19(y1), r7=381(x2), r8=244(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 6
LDI r1, 127
LDI r2, 94
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 19
LDI r7, 381
LDI r8, 244
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
