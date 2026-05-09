; DESCRIPTION: Draws a white line from (28, 16) to (178, 66).
; PLAN: r0=28(x1), r1=16(y1), r2=178(x2), r3=66(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 16
LDI r2, 178
LDI r3, 66
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
