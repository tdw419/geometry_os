; DESCRIPTION: Renders a green line between points (196, 220) and (492, 126).
; PLAN: r0=196(x1), r1=220(y1), r2=492(x2), r3=126(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 220
LDI r2, 492
LDI r3, 126
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
