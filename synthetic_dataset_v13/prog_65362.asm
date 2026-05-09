; DESCRIPTION: Draws a cyan line from (500, 244) to (481, 96).
; PLAN: r0=500(x1), r1=244(y1), r2=481(x2), r3=96(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 244
LDI r2, 481
LDI r3, 96
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
