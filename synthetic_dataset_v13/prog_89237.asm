; DESCRIPTION: Draws a cyan line from (132, 244) to (78, 249).
; PLAN: r0=132(x1), r1=244(y1), r2=78(x2), r3=249(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 244
LDI r2, 78
LDI r3, 249
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
