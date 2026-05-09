; DESCRIPTION: Renders a yellow box of size 56x82 starting at (33, 64).
; PLAN: r0=33(x), r1=64(y), r2=56(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 64
LDI r2, 56
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
