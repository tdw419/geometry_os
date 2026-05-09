; DESCRIPTION: Renders a white line between points (398, 212) and (481, 44).
; PLAN: r0=398(x1), r1=212(y1), r2=481(x2), r3=44(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 212
LDI r2, 481
LDI r3, 44
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
