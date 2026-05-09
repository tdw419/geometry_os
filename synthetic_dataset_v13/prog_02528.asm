; DESCRIPTION: Draws a cyan line from (53, 145) to (76, 29).
; PLAN: r0=53(x1), r1=145(y1), r2=76(x2), r3=29(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 145
LDI r2, 76
LDI r3, 29
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
