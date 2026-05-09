; DESCRIPTION: Places a green line segment connecting (363, 98) to (213, 14).
; PLAN: r0=363(x1), r1=98(y1), r2=213(x2), r3=14(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 98
LDI r2, 213
LDI r3, 14
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
