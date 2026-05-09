; DESCRIPTION: Draws a green line from (244, 27) to (293, 61).
; PLAN: r0=244(x1), r1=27(y1), r2=293(x2), r3=61(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 27
LDI r2, 293
LDI r3, 61
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
