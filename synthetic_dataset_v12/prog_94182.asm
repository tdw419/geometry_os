; DESCRIPTION: Draws a cyan line from (356, 199) to (266, 95).
; PLAN: r0=356(x1), r1=199(y1), r2=266(x2), r3=95(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 199
LDI r2, 266
LDI r3, 95
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
