; DESCRIPTION: Renders a green line between points (383, 102) and (103, 43).
; PLAN: r0=383(x1), r1=102(y1), r2=103(x2), r3=43(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 102
LDI r2, 103
LDI r3, 43
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
