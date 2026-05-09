; DESCRIPTION: Places a red circle of radius 55 at center (398, 178).
; PLAN: r0=398(x), r1=178(y), r2=55(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 398
LDI r1, 178
LDI r2, 55
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
