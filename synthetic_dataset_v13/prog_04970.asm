; DESCRIPTION: Draws a green line from (349, 202) to (274, 57).
; PLAN: r0=349(x1), r1=202(y1), r2=274(x2), r3=57(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 202
LDI r2, 274
LDI r3, 57
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
