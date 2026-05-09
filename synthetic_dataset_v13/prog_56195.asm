; DESCRIPTION: Places a cyan line segment connecting (103, 30) to (267, 187).
; PLAN: r0=103(x1), r1=30(y1), r2=267(x2), r3=187(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 30
LDI r2, 267
LDI r3, 187
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
