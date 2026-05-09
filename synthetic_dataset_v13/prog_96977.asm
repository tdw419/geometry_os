; DESCRIPTION: Renders a black line between points (138, 207) and (391, 213).
; PLAN: r0=138(x1), r1=207(y1), r2=391(x2), r3=213(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 207
LDI r2, 391
LDI r3, 213
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
