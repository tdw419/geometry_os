; DESCRIPTION: Places a cyan line segment connecting (267, 62) to (48, 56).
; PLAN: r0=267(x1), r1=62(y1), r2=48(x2), r3=56(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 62
LDI r2, 48
LDI r3, 56
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
