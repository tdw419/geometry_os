; DESCRIPTION: Renders a red box of size 62x21 starting at (405, 40).
; PLAN: r0=405(x), r1=40(y), r2=62(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 40
LDI r2, 62
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
