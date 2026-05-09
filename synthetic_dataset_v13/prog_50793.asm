; DESCRIPTION: Renders a yellow box of size 77x59 starting at (398, 0).
; PLAN: r0=398(x), r1=0(y), r2=77(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 0
LDI r2, 77
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
