; DESCRIPTION: Draws a green line from (300, 197) to (478, 57).
; PLAN: r0=300(x1), r1=197(y1), r2=478(x2), r3=57(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 197
LDI r2, 478
LDI r3, 57
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
