; DESCRIPTION: Composite: Places a blue 99x14 rectangle at position (235, 222) then Draws a red line from (368, 66) to (492, 138) then Places a yellow dot at position (437, 184).
; PLAN: r0=235(x), r1=222(y), r2=99(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=368(x1), r6=66(y1), r7=492(x2), r8=138(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=437(x), r11=184(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 235
LDI r1, 222
LDI r2, 99
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 66
LDI r7, 492
LDI r8, 138
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 437
LDI r11, 184
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
