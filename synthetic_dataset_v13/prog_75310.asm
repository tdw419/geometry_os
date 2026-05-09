; DESCRIPTION: Draws a blue line from (224, 187) to (92, 37).
; PLAN: r0=224(x1), r1=187(y1), r2=92(x2), r3=37(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 187
LDI r2, 92
LDI r3, 37
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
