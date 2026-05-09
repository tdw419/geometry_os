; DESCRIPTION: Draws a cyan line from (84, 102) to (433, 73).
; PLAN: r0=84(x1), r1=102(y1), r2=433(x2), r3=73(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 102
LDI r2, 433
LDI r3, 73
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
