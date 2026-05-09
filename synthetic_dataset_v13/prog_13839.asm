; DESCRIPTION: Renders a yellow line between points (88, 158) and (386, 213).
; PLAN: r0=88(x1), r1=158(y1), r2=386(x2), r3=213(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 158
LDI r2, 386
LDI r3, 213
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
