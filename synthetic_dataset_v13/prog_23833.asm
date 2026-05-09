; DESCRIPTION: Renders a yellow box of size 30x13 starting at (245, 14).
; PLAN: r0=245(x), r1=14(y), r2=30(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 14
LDI r2, 30
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
