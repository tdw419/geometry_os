; DESCRIPTION: Renders a cyan line between points (331, 10) and (387, 37).
; PLAN: r0=331(x1), r1=10(y1), r2=387(x2), r3=37(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 10
LDI r2, 387
LDI r3, 37
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
