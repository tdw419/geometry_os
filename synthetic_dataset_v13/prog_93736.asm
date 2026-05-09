; DESCRIPTION: Places a blue circle of radius 29 at center (305, 146).
; PLAN: r0=305(x), r1=146(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 305
LDI r1, 146
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
