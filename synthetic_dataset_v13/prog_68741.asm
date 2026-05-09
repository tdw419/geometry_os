; DESCRIPTION: Renders a cyan line between points (338, 78) and (121, 150).
; PLAN: r0=338(x1), r1=78(y1), r2=121(x2), r3=150(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 78
LDI r2, 121
LDI r3, 150
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
