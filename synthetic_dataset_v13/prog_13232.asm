; DESCRIPTION: Places a red circle of radius 26 at center (398, 135).
; PLAN: r0=398(x), r1=135(y), r2=26(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 398
LDI r1, 135
LDI r2, 26
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
