; DESCRIPTION: Renders a yellow box of size 95x56 starting at (245, 48).
; PLAN: r0=245(x), r1=48(y), r2=95(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 48
LDI r2, 95
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
