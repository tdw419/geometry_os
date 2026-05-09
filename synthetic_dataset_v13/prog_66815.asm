; DESCRIPTION: Renders a cyan line between points (462, 99) and (415, 33).
; PLAN: r0=462(x1), r1=99(y1), r2=415(x2), r3=33(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 99
LDI r2, 415
LDI r3, 33
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
