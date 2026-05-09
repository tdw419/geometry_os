; DESCRIPTION: Creates a cyan circular shape at (398, 120) with radius 59.
; PLAN: r0=398(x), r1=120(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 398
LDI r1, 120
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
