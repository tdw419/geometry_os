; DESCRIPTION: Draws a green line from (87, 152) to (64, 178).
; PLAN: r0=87(x1), r1=152(y1), r2=64(x2), r3=178(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 152
LDI r2, 64
LDI r3, 178
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
