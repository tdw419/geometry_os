; DESCRIPTION: Draws a black line from (92, 255) to (16, 168).
; PLAN: r0=92(x1), r1=255(y1), r2=16(x2), r3=168(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 255
LDI r2, 16
LDI r3, 168
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
