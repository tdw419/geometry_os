; DESCRIPTION: Composite: Renders a purple line between points (381, 247) and (445, 103) then Places a yellow dot at position (53, 19) then Creates a cyan rectangular region at (150, 84) spanning 54 by 67 pixels.
; PLAN: r0=381(x1), r1=247(y1), r2=445(x2), r3=103(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=53(x), r6=19(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=150(x), r11=84(y), r12=54(width), r13=67(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 381
LDI r1, 247
LDI r2, 445
LDI r3, 103
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 53
LDI r6, 19
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 150
LDI r11, 84
LDI r12, 54
LDI r13, 67
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
