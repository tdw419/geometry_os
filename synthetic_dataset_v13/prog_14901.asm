; DESCRIPTION: Renders a green line between points (228, 214) and (420, 80).
; PLAN: r0=228(x1), r1=214(y1), r2=420(x2), r3=80(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 214
LDI r2, 420
LDI r3, 80
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
