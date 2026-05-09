; DESCRIPTION: Composite: Creates a green rectangular region at (405, 29) spanning 91 by 117 pixels then Draws a white line from (481, 23) to (37, 114) then Places a black dot at position (180, 143).
; PLAN: r0=405(x), r1=29(y), r2=91(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=481(x1), r6=23(y1), r7=37(x2), r8=114(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=180(x), r11=143(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 405
LDI r1, 29
LDI r2, 91
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 481
LDI r6, 23
LDI r7, 37
LDI r8, 114
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 180
LDI r11, 143
LDI r12, 0x000000
PSET r10, r11, r12
HALT
