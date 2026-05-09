; DESCRIPTION: Draws a green line from (469, 154) to (433, 132).
; PLAN: r0=469(x1), r1=154(y1), r2=433(x2), r3=132(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 154
LDI r2, 433
LDI r3, 132
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
