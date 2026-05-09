; DESCRIPTION: Renders a black line between points (333, 58) and (29, 213).
; PLAN: r0=333(x1), r1=58(y1), r2=29(x2), r3=213(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 58
LDI r2, 29
LDI r3, 213
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
