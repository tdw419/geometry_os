; DESCRIPTION: Composite: Places a white line segment connecting (445, 194) to (362, 29) then Draws a cyan rectangle at (282, 96) with width 116 and height 96 then Sets a single orange pixel at (435, 52).
; PLAN: r0=445(x1), r1=194(y1), r2=362(x2), r3=29(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=282(x), r6=96(y), r7=116(width), r8=96(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=435(x), r11=52(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 445
LDI r1, 194
LDI r2, 362
LDI r3, 29
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 96
LDI r7, 116
LDI r8, 96
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 435
LDI r11, 52
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
