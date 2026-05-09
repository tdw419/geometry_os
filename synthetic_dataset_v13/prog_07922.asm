; DESCRIPTION: Renders a yellow box of size 120x76 starting at (83, 120).
; PLAN: r0=83(x), r1=120(y), r2=120(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 120
LDI r2, 120
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
