; DESCRIPTION: Places a cyan line segment connecting (279, 76) to (377, 43).
; PLAN: r0=279(x1), r1=76(y1), r2=377(x2), r3=43(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 76
LDI r2, 377
LDI r3, 43
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
