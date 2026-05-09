; DESCRIPTION: Composite: Places a yellow 71x13 rectangle at position (104, 221) then Draws a black line from (388, 103) to (13, 209) then Sets a single orange pixel at (37, 131).
; PLAN: r0=104(x), r1=221(y), r2=71(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=388(x1), r6=103(y1), r7=13(x2), r8=209(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=37(x), r11=131(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 104
LDI r1, 221
LDI r2, 71
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 103
LDI r7, 13
LDI r8, 209
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 37
LDI r11, 131
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
