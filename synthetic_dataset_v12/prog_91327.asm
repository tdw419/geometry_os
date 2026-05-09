; DESCRIPTION: Places a cyan line segment connecting (377, 28) to (333, 135).
; PLAN: r0=377(x1), r1=28(y1), r2=333(x2), r3=135(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 28
LDI r2, 333
LDI r3, 135
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
