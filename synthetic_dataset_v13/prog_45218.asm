; DESCRIPTION: Composite: Places a cyan 102x90 rectangle at position (372, 70) then Draws a magenta line from (494, 137) to (448, 200) then Places a red dot at position (14, 207).
; PLAN: r0=372(x), r1=70(y), r2=102(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=494(x1), r6=137(y1), r7=448(x2), r8=200(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=14(x), r11=207(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 372
LDI r1, 70
LDI r2, 102
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 494
LDI r6, 137
LDI r7, 448
LDI r8, 200
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 14
LDI r11, 207
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
