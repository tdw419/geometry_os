; DESCRIPTION: Places a green line segment connecting (267, 48) to (384, 236).
; PLAN: r0=267(x1), r1=48(y1), r2=384(x2), r3=236(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 48
LDI r2, 384
LDI r3, 236
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
