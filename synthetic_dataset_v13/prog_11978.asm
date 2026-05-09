; DESCRIPTION: Places a purple circle of radius 46 at center (198, 107).
; PLAN: r0=198(x), r1=107(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 107
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
