; DESCRIPTION: Renders a green line between points (75, 52) and (259, 213).
; PLAN: r0=75(x1), r1=52(y1), r2=259(x2), r3=213(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 52
LDI r2, 259
LDI r3, 213
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
