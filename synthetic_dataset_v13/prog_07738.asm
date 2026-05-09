; DESCRIPTION: Places a red circle of radius 21 at center (333, 207).
; PLAN: r0=333(x), r1=207(y), r2=21(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 333
LDI r1, 207
LDI r2, 21
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
