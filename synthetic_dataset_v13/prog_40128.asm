; DESCRIPTION: Places a red circle of radius 65 at center (70, 109).
; PLAN: r0=70(x), r1=109(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 109
LDI r2, 65
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
