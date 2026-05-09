; DESCRIPTION: Renders a green line between points (264, 65) and (97, 213).
; PLAN: r0=264(x1), r1=65(y1), r2=97(x2), r3=213(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 65
LDI r2, 97
LDI r3, 213
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
