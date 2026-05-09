; DESCRIPTION: Places a yellow circle of radius 77 at center (87, 113).
; PLAN: r0=87(x), r1=113(y), r2=77(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 113
LDI r2, 77
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
