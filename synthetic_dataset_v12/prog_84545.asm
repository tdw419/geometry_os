; DESCRIPTION: Places a purple circle of radius 27 at center (302, 213).
; PLAN: r0=302(x), r1=213(y), r2=27(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 213
LDI r2, 27
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
