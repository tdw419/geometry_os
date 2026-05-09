; DESCRIPTION: Places a yellow circle of radius 27 at center (298, 60).
; PLAN: r0=298(x), r1=60(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 298
LDI r1, 60
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
