; DESCRIPTION: Places a cyan line segment connecting (460, 229) to (125, 238).
; PLAN: r0=460(x1), r1=229(y1), r2=125(x2), r3=238(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 229
LDI r2, 125
LDI r3, 238
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
