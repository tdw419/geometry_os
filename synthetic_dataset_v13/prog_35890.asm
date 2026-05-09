; DESCRIPTION: Draws a green line from (77, 86) to (401, 20).
; PLAN: r0=77(x1), r1=86(y1), r2=401(x2), r3=20(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 86
LDI r2, 401
LDI r3, 20
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
