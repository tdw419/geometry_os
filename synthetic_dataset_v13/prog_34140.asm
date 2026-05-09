; DESCRIPTION: Places a cyan line segment connecting (267, 10) to (52, 72).
; PLAN: r0=267(x1), r1=10(y1), r2=52(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 10
LDI r2, 52
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
