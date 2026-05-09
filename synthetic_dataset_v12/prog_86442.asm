; DESCRIPTION: Renders a green line between points (143, 197) and (340, 184).
; PLAN: r0=143(x1), r1=197(y1), r2=340(x2), r3=184(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 197
LDI r2, 340
LDI r3, 184
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
