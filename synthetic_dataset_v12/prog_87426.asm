; DESCRIPTION: Places a red circle of radius 77 at center (398, 99).
; PLAN: r0=398(x), r1=99(y), r2=77(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 398
LDI r1, 99
LDI r2, 77
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
