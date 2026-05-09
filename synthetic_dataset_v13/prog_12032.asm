; DESCRIPTION: Composite: Draws a red line from (187, 87) to (54, 12) then Renders a blue box of size 44x27 starting at (404, 181) then Places a black dot at position (87, 91).
; PLAN: r0=187(x1), r1=87(y1), r2=54(x2), r3=12(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=404(x), r6=181(y), r7=44(width), r8=27(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=87(x), r11=91(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 187
LDI r1, 87
LDI r2, 54
LDI r3, 12
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 404
LDI r6, 181
LDI r7, 44
LDI r8, 27
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 87
LDI r11, 91
LDI r12, 0x000000
PSET r10, r11, r12
HALT
