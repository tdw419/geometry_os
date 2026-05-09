; DESCRIPTION: Draws a green line from (413, 10) to (161, 57).
; PLAN: r0=413(x1), r1=10(y1), r2=161(x2), r3=57(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 10
LDI r2, 161
LDI r3, 57
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
