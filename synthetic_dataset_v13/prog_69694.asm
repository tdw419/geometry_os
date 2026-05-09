; DESCRIPTION: Places a green line segment connecting (228, 214) to (285, 107).
; PLAN: r0=228(x1), r1=214(y1), r2=285(x2), r3=107(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 214
LDI r2, 285
LDI r3, 107
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
