; DESCRIPTION: Draws a white line from (164, 32) to (208, 33).
; PLAN: r0=164(x1), r1=32(y1), r2=208(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 32
LDI r2, 208
LDI r3, 33
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
