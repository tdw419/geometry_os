; DESCRIPTION: Places a red circle of radius 68 at center (440, 71).
; PLAN: r0=440(x), r1=71(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 440
LDI r1, 71
LDI r2, 68
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
