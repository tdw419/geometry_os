; DESCRIPTION: Draws a cyan line from (285, 234) to (334, 96).
; PLAN: r0=285(x1), r1=234(y1), r2=334(x2), r3=96(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 234
LDI r2, 334
LDI r3, 96
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
