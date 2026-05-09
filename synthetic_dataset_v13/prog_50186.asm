; DESCRIPTION: Renders a red box of size 56x28 starting at (388, 204).
; PLAN: r0=388(x), r1=204(y), r2=56(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 204
LDI r2, 56
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
