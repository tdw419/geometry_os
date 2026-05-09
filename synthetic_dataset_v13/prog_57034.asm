; DESCRIPTION: Draws a green line from (415, 38) to (3, 76).
; PLAN: r0=415(x1), r1=38(y1), r2=3(x2), r3=76(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 38
LDI r2, 3
LDI r3, 76
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
