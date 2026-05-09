; DESCRIPTION: Composite: Places a yellow 98x36 rectangle at position (193, 23) then Draws a green line from (10, 212) to (6, 182) then Sets a single green pixel at (305, 13).
; PLAN: r0=193(x), r1=23(y), r2=98(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=10(x1), r6=212(y1), r7=6(x2), r8=182(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=305(x), r11=13(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 193
LDI r1, 23
LDI r2, 98
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 10
LDI r6, 212
LDI r7, 6
LDI r8, 182
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 305
LDI r11, 13
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
