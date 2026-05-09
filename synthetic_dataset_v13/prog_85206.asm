; DESCRIPTION: Composite: Draws a blue line from (445, 224) to (160, 68) then Places a blue 79x103 rectangle at position (327, 108) then Places a purple dot at position (508, 222).
; PLAN: r0=445(x1), r1=224(y1), r2=160(x2), r3=68(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=327(x), r6=108(y), r7=79(width), r8=103(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=508(x), r11=222(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 445
LDI r1, 224
LDI r2, 160
LDI r3, 68
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 108
LDI r7, 79
LDI r8, 103
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 508
LDI r11, 222
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
