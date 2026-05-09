; DESCRIPTION: Draws a blue line from (290, 242) to (293, 143).
; PLAN: r0=290(x1), r1=242(y1), r2=293(x2), r3=143(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 242
LDI r2, 293
LDI r3, 143
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
