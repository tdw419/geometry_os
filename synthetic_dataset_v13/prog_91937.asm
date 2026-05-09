; DESCRIPTION: Renders a green line between points (453, 248) and (150, 215).
; PLAN: r0=453(x1), r1=248(y1), r2=150(x2), r3=215(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 248
LDI r2, 150
LDI r3, 215
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
