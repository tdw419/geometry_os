; DESCRIPTION: Renders a cyan line between points (510, 110) and (107, 152).
; PLAN: r0=510(x1), r1=110(y1), r2=107(x2), r3=152(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 110
LDI r2, 107
LDI r3, 152
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
