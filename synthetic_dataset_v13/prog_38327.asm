; DESCRIPTION: Places a cyan line segment connecting (170, 14) to (221, 125).
; PLAN: r0=170(x1), r1=14(y1), r2=221(x2), r3=125(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 14
LDI r2, 221
LDI r3, 125
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
