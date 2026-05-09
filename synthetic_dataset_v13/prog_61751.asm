; DESCRIPTION: Draws a green line from (195, 3) to (210, 152).
; PLAN: r0=195(x1), r1=3(y1), r2=210(x2), r3=152(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 3
LDI r2, 210
LDI r3, 152
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
