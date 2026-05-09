; DESCRIPTION: Places a green circle of radius 43 at center (277, 210).
; PLAN: r0=277(x), r1=210(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 277
LDI r1, 210
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
