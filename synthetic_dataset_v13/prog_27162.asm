; DESCRIPTION: Places a green line segment connecting (293, 108) to (189, 27).
; PLAN: r0=293(x1), r1=108(y1), r2=189(x2), r3=27(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 108
LDI r2, 189
LDI r3, 27
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
