; DESCRIPTION: Draws a green line from (212, 191) to (209, 92).
; PLAN: r0=212(x1), r1=191(y1), r2=209(x2), r3=92(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 191
LDI r2, 209
LDI r3, 92
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
