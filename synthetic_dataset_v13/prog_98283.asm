; DESCRIPTION: Renders a red box of size 120x58 starting at (289, 6).
; PLAN: r0=289(x), r1=6(y), r2=120(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 6
LDI r2, 120
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
