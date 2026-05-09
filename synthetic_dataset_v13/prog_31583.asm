; DESCRIPTION: Renders a cyan line between points (38, 229) and (48, 58).
; PLAN: r0=38(x1), r1=229(y1), r2=48(x2), r3=58(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 229
LDI r2, 48
LDI r3, 58
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
