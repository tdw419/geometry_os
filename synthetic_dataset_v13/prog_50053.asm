; DESCRIPTION: Places a yellow circle of radius 32 at center (303, 146).
; PLAN: r0=303(x), r1=146(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 146
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
