; DESCRIPTION: Renders a green line between points (440, 152) and (27, 117).
; PLAN: r0=440(x1), r1=152(y1), r2=27(x2), r3=117(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 152
LDI r2, 27
LDI r3, 117
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
