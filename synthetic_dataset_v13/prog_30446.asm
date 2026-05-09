; DESCRIPTION: Draws a green line from (186, 108) to (413, 49).
; PLAN: r0=186(x1), r1=108(y1), r2=413(x2), r3=49(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 108
LDI r2, 413
LDI r3, 49
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
