; DESCRIPTION: Draws a cyan line from (291, 2) to (428, 78).
; PLAN: r0=291(x1), r1=2(y1), r2=428(x2), r3=78(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 2
LDI r2, 428
LDI r3, 78
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
