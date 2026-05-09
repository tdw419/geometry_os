; DESCRIPTION: Renders a green line between points (173, 221) and (476, 37).
; PLAN: r0=173(x1), r1=221(y1), r2=476(x2), r3=37(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 221
LDI r2, 476
LDI r3, 37
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
