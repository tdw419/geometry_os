; DESCRIPTION: Renders a white line between points (327, 173) and (153, 61).
; PLAN: r0=327(x1), r1=173(y1), r2=153(x2), r3=61(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 173
LDI r2, 153
LDI r3, 61
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
