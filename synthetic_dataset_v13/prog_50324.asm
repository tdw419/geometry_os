; DESCRIPTION: Renders a cyan line between points (440, 120) and (77, 0).
; PLAN: r0=440(x1), r1=120(y1), r2=77(x2), r3=0(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 120
LDI r2, 77
LDI r3, 0
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
