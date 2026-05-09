; DESCRIPTION: Composite: Renders a cyan line between points (234, 93) and (304, 51) then Draws a magenta rectangle at (204, 3) with width 104 and height 110 then Places a green dot at position (408, 16).
; PLAN: r0=234(x1), r1=93(y1), r2=304(x2), r3=51(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=204(x), r6=3(y), r7=104(width), r8=110(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=408(x), r11=16(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 234
LDI r1, 93
LDI r2, 304
LDI r3, 51
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 3
LDI r7, 104
LDI r8, 110
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 408
LDI r11, 16
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
