; DESCRIPTION: Places a cyan line segment connecting (166, 138) to (493, 47).
; PLAN: r0=166(x1), r1=138(y1), r2=493(x2), r3=47(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 138
LDI r2, 493
LDI r3, 47
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
