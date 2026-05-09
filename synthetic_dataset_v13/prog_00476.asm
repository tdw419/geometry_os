; DESCRIPTION: Places a cyan line segment connecting (146, 169) to (267, 101).
; PLAN: r0=146(x1), r1=169(y1), r2=267(x2), r3=101(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 169
LDI r2, 267
LDI r3, 101
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
