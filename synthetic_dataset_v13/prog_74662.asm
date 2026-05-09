; DESCRIPTION: Renders a cyan line between points (55, 166) and (393, 9).
; PLAN: r0=55(x1), r1=166(y1), r2=393(x2), r3=9(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 166
LDI r2, 393
LDI r3, 9
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
