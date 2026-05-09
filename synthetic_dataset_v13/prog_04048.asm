; DESCRIPTION: Draws a magenta line from (360, 221) to (371, 244).
; PLAN: r0=360(x1), r1=221(y1), r2=371(x2), r3=244(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 221
LDI r2, 371
LDI r3, 244
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
