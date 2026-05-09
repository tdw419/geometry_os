; DESCRIPTION: Renders a green line between points (384, 132) and (446, 197).
; PLAN: r0=384(x1), r1=132(y1), r2=446(x2), r3=197(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 132
LDI r2, 446
LDI r3, 197
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
