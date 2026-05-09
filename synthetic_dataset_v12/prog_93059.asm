; DESCRIPTION: Draws a cyan line from (1, 23) to (409, 238).
; PLAN: r0=1(x1), r1=23(y1), r2=409(x2), r3=238(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 23
LDI r2, 409
LDI r3, 238
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
