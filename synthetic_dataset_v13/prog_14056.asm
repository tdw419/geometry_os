; DESCRIPTION: Renders a cyan line between points (1, 191) and (151, 89).
; PLAN: r0=1(x1), r1=191(y1), r2=151(x2), r3=89(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 191
LDI r2, 151
LDI r3, 89
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
