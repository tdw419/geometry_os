; DESCRIPTION: Composite: Draws a orange line from (358, 61) to (383, 247) then Places a yellow 36x92 rectangle at position (254, 46) then Places a purple dot at position (320, 199).
; PLAN: r0=358(x1), r1=61(y1), r2=383(x2), r3=247(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=254(x), r6=46(y), r7=36(width), r8=92(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=320(x), r11=199(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 358
LDI r1, 61
LDI r2, 383
LDI r3, 247
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 46
LDI r7, 36
LDI r8, 92
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 320
LDI r11, 199
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
