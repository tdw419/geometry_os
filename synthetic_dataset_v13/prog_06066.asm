; DESCRIPTION: Renders a black line between points (387, 42) and (108, 133).
; PLAN: r0=387(x1), r1=42(y1), r2=108(x2), r3=133(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 42
LDI r2, 108
LDI r3, 133
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
