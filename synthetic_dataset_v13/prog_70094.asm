; DESCRIPTION: Renders a red box of size 101x84 starting at (405, 168).
; PLAN: r0=405(x), r1=168(y), r2=101(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 168
LDI r2, 101
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
