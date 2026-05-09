; DESCRIPTION: Draws a yellow line from (305, 152) to (293, 149).
; PLAN: r0=305(x1), r1=152(y1), r2=293(x2), r3=149(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 152
LDI r2, 293
LDI r3, 149
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
