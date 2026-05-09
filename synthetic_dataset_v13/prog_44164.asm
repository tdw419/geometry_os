; DESCRIPTION: Renders a blue line between points (383, 59) and (329, 42).
; PLAN: r0=383(x1), r1=59(y1), r2=329(x2), r3=42(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 59
LDI r2, 329
LDI r3, 42
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
