; DESCRIPTION: Renders a black line between points (470, 16) and (128, 37).
; PLAN: r0=470(x1), r1=16(y1), r2=128(x2), r3=37(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 16
LDI r2, 128
LDI r3, 37
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
