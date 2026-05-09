; DESCRIPTION: Renders a yellow box of size 102x48 starting at (73, 56).
; PLAN: r0=73(x), r1=56(y), r2=102(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 56
LDI r2, 102
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
