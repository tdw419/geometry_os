; DESCRIPTION: Composite: Sets a single green pixel at (371, 13) then Draws a red line from (37, 128) to (273, 195) then Draws a yellow rectangle at (405, 86) with width 31 and height 103.
; PLAN: r0=371(x), r1=13(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=37(x1), r6=128(y1), r7=273(x2), r8=195(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=405(x), r11=86(y), r12=31(width), r13=103(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 371
LDI r1, 13
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 37
LDI r6, 128
LDI r7, 273
LDI r8, 195
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 405
LDI r11, 86
LDI r12, 31
LDI r13, 103
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
