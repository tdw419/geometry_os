; DESCRIPTION: Composite: Draws a orange line from (73, 54) to (151, 19) then Creates a orange rectangular region at (215, 37) spanning 92 by 44 pixels.
; PLAN: r0=73(x1), r1=54(y1), r2=151(x2), r3=19(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=215(x), r6=37(y), r7=92(width), r8=44(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 73
LDI r1, 54
LDI r2, 151
LDI r3, 19
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 215
LDI r6, 37
LDI r7, 92
LDI r8, 44
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
