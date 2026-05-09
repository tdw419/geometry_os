; DESCRIPTION: Renders a green line between points (276, 196) and (469, 173).
; PLAN: r0=276(x1), r1=196(y1), r2=469(x2), r3=173(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 196
LDI r2, 469
LDI r3, 173
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
