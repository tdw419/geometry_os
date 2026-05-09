; DESCRIPTION: Composite: Places a green 20x79 rectangle at position (229, 173) then Draws a green line from (87, 54) to (30, 73) then Places a magenta dot at position (341, 46).
; PLAN: r0=229(x), r1=173(y), r2=20(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=87(x1), r6=54(y1), r7=30(x2), r8=73(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=341(x), r11=46(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 229
LDI r1, 173
LDI r2, 20
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 54
LDI r7, 30
LDI r8, 73
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 341
LDI r11, 46
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
