; DESCRIPTION: Composite: Renders a blue box of size 68x14 starting at (72, 133) then Draws a cyan line from (364, 241) to (12, 108) then Places a red dot at position (152, 33).
; PLAN: r0=72(x), r1=133(y), r2=68(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=364(x1), r6=241(y1), r7=12(x2), r8=108(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=152(x), r11=33(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 72
LDI r1, 133
LDI r2, 68
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 364
LDI r6, 241
LDI r7, 12
LDI r8, 108
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 152
LDI r11, 33
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
