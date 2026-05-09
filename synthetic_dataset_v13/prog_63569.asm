; DESCRIPTION: Renders a yellow box of size 83x45 starting at (83, 8).
; PLAN: r0=83(x), r1=8(y), r2=83(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 8
LDI r2, 83
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
