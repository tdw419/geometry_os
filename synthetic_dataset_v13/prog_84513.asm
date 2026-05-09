; DESCRIPTION: Draws a cyan line from (162, 66) to (105, 92).
; PLAN: r0=162(x1), r1=66(y1), r2=105(x2), r3=92(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 66
LDI r2, 105
LDI r3, 92
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
