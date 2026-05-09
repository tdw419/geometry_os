; DESCRIPTION: Places a cyan line segment connecting (305, 238) to (267, 201).
; PLAN: r0=305(x1), r1=238(y1), r2=267(x2), r3=201(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 238
LDI r2, 267
LDI r3, 201
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
