; DESCRIPTION: Renders a cyan line between points (266, 79) and (366, 27).
; PLAN: r0=266(x1), r1=79(y1), r2=366(x2), r3=27(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 79
LDI r2, 366
LDI r3, 27
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
