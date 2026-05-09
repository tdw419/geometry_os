; DESCRIPTION: Draws a cyan line from (28, 170) to (349, 200).
; PLAN: r0=28(x1), r1=170(y1), r2=349(x2), r3=200(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 170
LDI r2, 349
LDI r3, 200
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
