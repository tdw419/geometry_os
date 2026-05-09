; DESCRIPTION: Composite: Draws a black rectangle at (137, 207) with width 77 and height 10 then Draws a blue line from (254, 231) to (182, 127) then Places a cyan dot at position (299, 11).
; PLAN: r0=137(x), r1=207(y), r2=77(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=254(x1), r6=231(y1), r7=182(x2), r8=127(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=299(x), r11=11(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 137
LDI r1, 207
LDI r2, 77
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 231
LDI r7, 182
LDI r8, 127
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 299
LDI r11, 11
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
