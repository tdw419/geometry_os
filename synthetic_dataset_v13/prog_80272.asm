; DESCRIPTION: Renders a cyan line between points (388, 68) and (287, 87).
; PLAN: r0=388(x1), r1=68(y1), r2=287(x2), r3=87(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 68
LDI r2, 287
LDI r3, 87
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
