; DESCRIPTION: Draws a green line from (115, 215) to (249, 55).
; PLAN: r0=115(x1), r1=215(y1), r2=249(x2), r3=55(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 215
LDI r2, 249
LDI r3, 55
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
