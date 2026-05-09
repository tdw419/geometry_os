; DESCRIPTION: Draws a white line from (426, 84) to (494, 139).
; PLAN: r0=426(x1), r1=84(y1), r2=494(x2), r3=139(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 84
LDI r2, 494
LDI r3, 139
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
