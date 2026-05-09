; DESCRIPTION: Draws a green line from (465, 208) to (458, 48).
; PLAN: r0=465(x1), r1=208(y1), r2=458(x2), r3=48(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 208
LDI r2, 458
LDI r3, 48
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
