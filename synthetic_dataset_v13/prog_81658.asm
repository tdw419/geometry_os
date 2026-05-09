; DESCRIPTION: Draws a cyan line from (168, 203) to (389, 33).
; PLAN: r0=168(x1), r1=203(y1), r2=389(x2), r3=33(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 203
LDI r2, 389
LDI r3, 33
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
