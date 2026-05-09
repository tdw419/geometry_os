; DESCRIPTION: Draws a green line from (69, 126) to (424, 142).
; PLAN: r0=69(x1), r1=126(y1), r2=424(x2), r3=142(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 126
LDI r2, 424
LDI r3, 142
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
