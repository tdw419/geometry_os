; DESCRIPTION: Draws a cyan line from (9, 14) to (428, 7).
; PLAN: r0=9(x1), r1=14(y1), r2=428(x2), r3=7(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 14
LDI r2, 428
LDI r3, 7
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
