; DESCRIPTION: Places a yellow circle of radius 64 at center (202, 174).
; PLAN: r0=202(x), r1=174(y), r2=64(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 174
LDI r2, 64
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
