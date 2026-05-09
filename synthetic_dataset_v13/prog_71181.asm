; DESCRIPTION: Renders a red line between points (484, 214) and (412, 242).
; PLAN: r0=484(x1), r1=214(y1), r2=412(x2), r3=242(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 214
LDI r2, 412
LDI r3, 242
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
