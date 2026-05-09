; DESCRIPTION: Places a green line segment connecting (502, 98) to (312, 173).
; PLAN: r0=502(x1), r1=98(y1), r2=312(x2), r3=173(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 98
LDI r2, 312
LDI r3, 173
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
