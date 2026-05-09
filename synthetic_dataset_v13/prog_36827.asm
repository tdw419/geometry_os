; DESCRIPTION: Draws a cyan line from (459, 226) to (474, 89).
; PLAN: r0=459(x1), r1=226(y1), r2=474(x2), r3=89(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 226
LDI r2, 474
LDI r3, 89
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
