; DESCRIPTION: Places a cyan line segment connecting (84, 124) to (493, 165).
; PLAN: r0=84(x1), r1=124(y1), r2=493(x2), r3=165(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 124
LDI r2, 493
LDI r3, 165
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
