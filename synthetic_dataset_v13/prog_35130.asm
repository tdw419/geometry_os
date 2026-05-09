; DESCRIPTION: Places a green circle of radius 42 at center (59, 59).
; PLAN: r0=59(x), r1=59(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 59
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
