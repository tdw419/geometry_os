; DESCRIPTION: Places a black line segment connecting (363, 126) to (393, 146).
; PLAN: r0=363(x1), r1=126(y1), r2=393(x2), r3=146(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 126
LDI r2, 393
LDI r3, 146
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
