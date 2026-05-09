; DESCRIPTION: Composite: Renders a green box of size 75x51 starting at (63, 194) then Draws a black line from (464, 222) to (57, 89) then Places a blue dot at position (197, 180).
; PLAN: r0=63(x), r1=194(y), r2=75(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=464(x1), r6=222(y1), r7=57(x2), r8=89(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=197(x), r11=180(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 63
LDI r1, 194
LDI r2, 75
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 464
LDI r6, 222
LDI r7, 57
LDI r8, 89
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 197
LDI r11, 180
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
