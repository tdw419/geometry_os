; DESCRIPTION: Places a red circle of radius 56 at center (387, 68).
; PLAN: r0=387(x), r1=68(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 68
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
