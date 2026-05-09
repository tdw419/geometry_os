; DESCRIPTION: Places a white line segment connecting (243, 194) to (493, 225).
; PLAN: r0=243(x1), r1=194(y1), r2=493(x2), r3=225(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 194
LDI r2, 493
LDI r3, 225
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
