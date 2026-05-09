; DESCRIPTION: Composite: Creates a cyan rectangular region at (29, 54) spanning 30 by 91 pixels then Places a yellow dot at position (426, 28) then Draws a purple line from (398, 25) to (172, 30).
; PLAN: r0=29(x), r1=54(y), r2=30(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=426(x), r6=28(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=398(x1), r11=25(y1), r12=172(x2), r13=30(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 29
LDI r1, 54
LDI r2, 30
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 426
LDI r6, 28
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 398
LDI r11, 25
LDI r12, 172
LDI r13, 30
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
