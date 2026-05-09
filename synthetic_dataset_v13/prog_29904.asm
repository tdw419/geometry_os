; DESCRIPTION: Draws a green line from (212, 211) to (92, 134).
; PLAN: r0=212(x1), r1=211(y1), r2=92(x2), r3=134(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 211
LDI r2, 92
LDI r3, 134
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
