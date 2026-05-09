; DESCRIPTION: Draws a cyan line from (66, 112) to (13, 3).
; PLAN: r0=66(x1), r1=112(y1), r2=13(x2), r3=3(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 112
LDI r2, 13
LDI r3, 3
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
