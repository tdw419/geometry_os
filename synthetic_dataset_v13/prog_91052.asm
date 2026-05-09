; DESCRIPTION: Places a red circle of radius 37 at center (465, 175).
; PLAN: r0=465(x), r1=175(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 465
LDI r1, 175
LDI r2, 37
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
