; DESCRIPTION: Renders a yellow box of size 56x27 starting at (420, 73).
; PLAN: r0=420(x), r1=73(y), r2=56(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 73
LDI r2, 56
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
