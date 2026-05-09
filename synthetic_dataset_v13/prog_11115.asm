; DESCRIPTION: Draws a orange line from (16, 186) to (468, 210).
; PLAN: r0=16(x1), r1=186(y1), r2=468(x2), r3=210(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 186
LDI r2, 468
LDI r3, 210
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
