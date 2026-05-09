; DESCRIPTION: Renders a yellow box of size 76x66 starting at (434, 92).
; PLAN: r0=434(x), r1=92(y), r2=76(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 92
LDI r2, 76
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
