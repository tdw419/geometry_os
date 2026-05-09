; DESCRIPTION: Places a cyan circle of radius 67 at center (369, 120).
; PLAN: r0=369(x), r1=120(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 369
LDI r1, 120
LDI r2, 67
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
