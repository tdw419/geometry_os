; DESCRIPTION: Draws a white line from (280, 242) to (11, 20).
; PLAN: r0=280(x1), r1=242(y1), r2=11(x2), r3=20(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 242
LDI r2, 11
LDI r3, 20
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
