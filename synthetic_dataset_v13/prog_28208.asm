; DESCRIPTION: Composite: Creates a orange rectangular region at (25, 206) spanning 111 by 36 pixels then Draws a white line from (120, 128) to (166, 28) then Sets a single black pixel at (61, 140).
; PLAN: r0=25(x), r1=206(y), r2=111(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=120(x1), r6=128(y1), r7=166(x2), r8=28(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=61(x), r11=140(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 25
LDI r1, 206
LDI r2, 111
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 128
LDI r7, 166
LDI r8, 28
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 61
LDI r11, 140
LDI r12, 0x000000
PSET r10, r11, r12
HALT
