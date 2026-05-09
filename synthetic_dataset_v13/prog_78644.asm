; DESCRIPTION: Draws a yellow line from (343, 124) to (291, 231).
; PLAN: r0=343(x1), r1=124(y1), r2=291(x2), r3=231(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 124
LDI r2, 291
LDI r3, 231
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
