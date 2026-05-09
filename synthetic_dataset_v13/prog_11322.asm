; DESCRIPTION: Renders a green line between points (186, 78) and (397, 215).
; PLAN: r0=186(x1), r1=78(y1), r2=397(x2), r3=215(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 78
LDI r2, 397
LDI r3, 215
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
