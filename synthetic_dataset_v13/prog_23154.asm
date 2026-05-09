; DESCRIPTION: Renders a green line between points (346, 173) and (170, 212).
; PLAN: r0=346(x1), r1=173(y1), r2=170(x2), r3=212(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 173
LDI r2, 170
LDI r3, 212
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
