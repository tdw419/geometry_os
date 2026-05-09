; DESCRIPTION: Places a yellow circle of radius 40 at center (361, 146).
; PLAN: r0=361(x), r1=146(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 146
LDI r2, 40
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
