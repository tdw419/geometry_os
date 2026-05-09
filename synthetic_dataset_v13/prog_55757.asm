; DESCRIPTION: Places a white line segment connecting (412, 215) to (17, 237).
; PLAN: r0=412(x1), r1=215(y1), r2=17(x2), r3=237(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 215
LDI r2, 17
LDI r3, 237
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
