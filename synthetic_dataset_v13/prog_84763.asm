; DESCRIPTION: Draws a cyan line from (377, 11) to (135, 33).
; PLAN: r0=377(x1), r1=11(y1), r2=135(x2), r3=33(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 11
LDI r2, 135
LDI r3, 33
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
