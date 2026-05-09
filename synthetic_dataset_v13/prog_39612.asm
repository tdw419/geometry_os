; DESCRIPTION: Draws a cyan line from (96, 5) to (260, 66).
; PLAN: r0=96(x1), r1=5(y1), r2=260(x2), r3=66(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 5
LDI r2, 260
LDI r3, 66
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
