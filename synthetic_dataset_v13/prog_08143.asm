; DESCRIPTION: Renders a purple line between points (171, 239) and (131, 173).
; PLAN: r0=171(x1), r1=239(y1), r2=131(x2), r3=173(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 239
LDI r2, 131
LDI r3, 173
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
