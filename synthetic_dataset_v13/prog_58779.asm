; DESCRIPTION: Composite: Places a cyan 117x51 rectangle at position (143, 163) then Draws a yellow line from (16, 62) to (305, 84) then Places a black dot at position (345, 126).
; PLAN: r0=143(x), r1=163(y), r2=117(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=16(x1), r6=62(y1), r7=305(x2), r8=84(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=345(x), r11=126(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 143
LDI r1, 163
LDI r2, 117
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 16
LDI r6, 62
LDI r7, 305
LDI r8, 84
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 345
LDI r11, 126
LDI r12, 0x000000
PSET r10, r11, r12
HALT
