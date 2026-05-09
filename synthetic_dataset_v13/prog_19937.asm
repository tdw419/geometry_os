; DESCRIPTION: Renders a orange line between points (434, 247) and (387, 173).
; PLAN: r0=434(x1), r1=247(y1), r2=387(x2), r3=173(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 247
LDI r2, 387
LDI r3, 173
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
