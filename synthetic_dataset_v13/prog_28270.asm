; DESCRIPTION: Places a purple circle of radius 44 at center (443, 117).
; PLAN: r0=443(x), r1=117(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 443
LDI r1, 117
LDI r2, 44
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
