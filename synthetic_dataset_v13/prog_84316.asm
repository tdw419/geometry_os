; DESCRIPTION: Renders a white line between points (128, 215) and (249, 212).
; PLAN: r0=128(x1), r1=215(y1), r2=249(x2), r3=212(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 215
LDI r2, 249
LDI r3, 212
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
