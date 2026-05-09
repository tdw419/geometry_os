; DESCRIPTION: Draws a cyan line from (33, 165) to (428, 54).
; PLAN: r0=33(x1), r1=165(y1), r2=428(x2), r3=54(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 165
LDI r2, 428
LDI r3, 54
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
