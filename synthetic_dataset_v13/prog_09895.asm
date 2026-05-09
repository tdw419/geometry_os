; DESCRIPTION: Composite: Draws a black line from (79, 8) to (453, 206) then Renders a cyan box of size 25x113 starting at (311, 109) then Places a purple dot at position (444, 130).
; PLAN: r0=79(x1), r1=8(y1), r2=453(x2), r3=206(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=311(x), r6=109(y), r7=25(width), r8=113(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=444(x), r11=130(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 79
LDI r1, 8
LDI r2, 453
LDI r3, 206
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 311
LDI r6, 109
LDI r7, 25
LDI r8, 113
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 444
LDI r11, 130
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
