; DESCRIPTION: Renders a blue line between points (180, 173) and (394, 159).
; PLAN: r0=180(x1), r1=173(y1), r2=394(x2), r3=159(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 173
LDI r2, 394
LDI r3, 159
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
