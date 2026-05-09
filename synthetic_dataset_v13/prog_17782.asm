; DESCRIPTION: Composite: Places a yellow dot at position (326, 23) then Draws a red line from (247, 8) to (349, 168) then Creates a yellow rectangular region at (174, 150) spanning 84 by 38 pixels.
; PLAN: r0=326(x), r1=23(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=247(x1), r6=8(y1), r7=349(x2), r8=168(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=174(x), r11=150(y), r12=84(width), r13=38(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 326
LDI r1, 23
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 247
LDI r6, 8
LDI r7, 349
LDI r8, 168
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 174
LDI r11, 150
LDI r12, 84
LDI r13, 38
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
