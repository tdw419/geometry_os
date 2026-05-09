; DESCRIPTION: Draws a cyan line from (489, 185) to (81, 48).
; PLAN: r0=489(x1), r1=185(y1), r2=81(x2), r3=48(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 185
LDI r2, 81
LDI r3, 48
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
