; DESCRIPTION: Places a cyan line segment connecting (208, 86) to (387, 58).
; PLAN: r0=208(x1), r1=86(y1), r2=387(x2), r3=58(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 86
LDI r2, 387
LDI r3, 58
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
