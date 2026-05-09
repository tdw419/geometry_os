; DESCRIPTION: Draws a blue line from (76, 168) to (206, 173).
; PLAN: r0=76(x1), r1=168(y1), r2=206(x2), r3=173(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 168
LDI r2, 206
LDI r3, 173
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
