; DESCRIPTION: Draws a cyan line from (220, 148) to (321, 218).
; PLAN: r0=220(x1), r1=148(y1), r2=321(x2), r3=218(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 148
LDI r2, 321
LDI r3, 218
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
