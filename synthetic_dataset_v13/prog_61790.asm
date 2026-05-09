; DESCRIPTION: Draws a green line from (365, 249) to (370, 45).
; PLAN: r0=365(x1), r1=249(y1), r2=370(x2), r3=45(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 249
LDI r2, 370
LDI r3, 45
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
