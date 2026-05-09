; DESCRIPTION: Renders a green line between points (249, 121) and (480, 126).
; PLAN: r0=249(x1), r1=121(y1), r2=480(x2), r3=126(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 121
LDI r2, 480
LDI r3, 126
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
