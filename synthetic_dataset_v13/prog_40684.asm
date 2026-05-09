; DESCRIPTION: Places a yellow circle of radius 77 at center (293, 146).
; PLAN: r0=293(x), r1=146(y), r2=77(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 146
LDI r2, 77
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
