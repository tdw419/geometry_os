; DESCRIPTION: Composite: Draws a red line from (503, 39) to (305, 108) then Places a purple dot at position (394, 90) then Creates a yellow rectangular region at (247, 229) spanning 36 by 19 pixels.
; PLAN: r0=503(x1), r1=39(y1), r2=305(x2), r3=108(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=394(x), r6=90(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=247(x), r11=229(y), r12=36(width), r13=19(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 503
LDI r1, 39
LDI r2, 305
LDI r3, 108
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 394
LDI r6, 90
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 247
LDI r11, 229
LDI r12, 36
LDI r13, 19
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
