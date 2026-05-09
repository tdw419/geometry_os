; DESCRIPTION: Renders a cyan line between points (305, 89) and (260, 50).
; PLAN: r0=305(x1), r1=89(y1), r2=260(x2), r3=50(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 89
LDI r2, 260
LDI r3, 50
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
