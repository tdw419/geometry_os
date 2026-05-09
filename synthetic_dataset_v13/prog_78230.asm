; DESCRIPTION: Draws a white line from (307, 28) to (2, 71).
; PLAN: r0=307(x1), r1=28(y1), r2=2(x2), r3=71(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 28
LDI r2, 2
LDI r3, 71
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
