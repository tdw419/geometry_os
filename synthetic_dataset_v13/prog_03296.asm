; DESCRIPTION: Renders a green line between points (387, 213) and (381, 208).
; PLAN: r0=387(x1), r1=213(y1), r2=381(x2), r3=208(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 213
LDI r2, 381
LDI r3, 208
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
