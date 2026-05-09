; DESCRIPTION: Places a purple circle of radius 45 at center (229, 182).
; PLAN: r0=229(x), r1=182(y), r2=45(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 229
LDI r1, 182
LDI r2, 45
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
