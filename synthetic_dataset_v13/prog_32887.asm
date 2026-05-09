; DESCRIPTION: Renders a blue line between points (346, 229) and (24, 236).
; PLAN: r0=346(x1), r1=229(y1), r2=24(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 229
LDI r2, 24
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
