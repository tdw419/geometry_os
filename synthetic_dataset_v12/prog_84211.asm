; DESCRIPTION: Draws a white line from (115, 1) to (307, 117).
; PLAN: r0=115(x1), r1=1(y1), r2=307(x2), r3=117(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 1
LDI r2, 307
LDI r3, 117
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
