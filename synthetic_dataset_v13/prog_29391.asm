; DESCRIPTION: Renders a green line between points (475, 0) and (9, 213).
; PLAN: r0=475(x1), r1=0(y1), r2=9(x2), r3=213(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 0
LDI r2, 9
LDI r3, 213
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
