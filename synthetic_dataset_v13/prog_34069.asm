; DESCRIPTION: Renders a yellow line between points (371, 221) and (507, 59).
; PLAN: r0=371(x1), r1=221(y1), r2=507(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 221
LDI r2, 507
LDI r3, 59
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
