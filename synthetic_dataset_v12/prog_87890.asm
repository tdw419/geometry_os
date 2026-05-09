; DESCRIPTION: Draws a green line from (211, 107) to (171, 152).
; PLAN: r0=211(x1), r1=107(y1), r2=171(x2), r3=152(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 107
LDI r2, 171
LDI r3, 152
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
