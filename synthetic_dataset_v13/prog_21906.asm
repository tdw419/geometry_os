; DESCRIPTION: Composite: Sets a single yellow pixel at (81, 168) then Draws a cyan rectangle at (392, 102) with width 42 and height 76 then Places a blue line segment connecting (489, 253) to (301, 142).
; PLAN: r0=81(x), r1=168(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=392(x), r6=102(y), r7=42(width), r8=76(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=489(x1), r11=253(y1), r12=301(x2), r13=142(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 81
LDI r1, 168
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 392
LDI r6, 102
LDI r7, 42
LDI r8, 76
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 489
LDI r11, 253
LDI r12, 301
LDI r13, 142
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
