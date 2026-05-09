; DESCRIPTION: Places a purple circle of radius 60 at center (446, 113).
; PLAN: r0=446(x), r1=113(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 446
LDI r1, 113
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
