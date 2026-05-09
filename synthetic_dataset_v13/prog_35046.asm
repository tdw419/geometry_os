; DESCRIPTION: Renders a black line between points (215, 133) and (176, 173).
; PLAN: r0=215(x1), r1=133(y1), r2=176(x2), r3=173(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 133
LDI r2, 176
LDI r3, 173
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
