; DESCRIPTION: Draws a cyan line from (334, 14) to (492, 100).
; PLAN: r0=334(x1), r1=14(y1), r2=492(x2), r3=100(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 14
LDI r2, 492
LDI r3, 100
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
