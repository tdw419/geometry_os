; DESCRIPTION: Draws a cyan line from (332, 150) to (31, 34).
; PLAN: r0=332(x1), r1=150(y1), r2=31(x2), r3=34(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 150
LDI r2, 31
LDI r3, 34
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
