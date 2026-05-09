; DESCRIPTION: Draws a orange line from (198, 228) to (486, 90).
; PLAN: r0=198(x1), r1=228(y1), r2=486(x2), r3=90(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 228
LDI r2, 486
LDI r3, 90
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
