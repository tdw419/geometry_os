; DESCRIPTION: Places a cyan line segment connecting (96, 229) to (243, 122).
; PLAN: r0=96(x1), r1=229(y1), r2=243(x2), r3=122(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 229
LDI r2, 243
LDI r3, 122
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
