; DESCRIPTION: Renders a white line between points (170, 180) and (384, 173).
; PLAN: r0=170(x1), r1=180(y1), r2=384(x2), r3=173(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 180
LDI r2, 384
LDI r3, 173
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
