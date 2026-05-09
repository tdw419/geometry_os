; DESCRIPTION: Draws a magenta line from (487, 99) to (298, 119).
; PLAN: r0=487(x1), r1=99(y1), r2=298(x2), r3=119(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 99
LDI r2, 298
LDI r3, 119
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
