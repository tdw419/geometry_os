; DESCRIPTION: Renders a white line between points (394, 173) and (94, 238).
; PLAN: r0=394(x1), r1=173(y1), r2=94(x2), r3=238(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 173
LDI r2, 94
LDI r3, 238
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
