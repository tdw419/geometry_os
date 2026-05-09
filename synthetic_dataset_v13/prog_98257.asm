; DESCRIPTION: Renders a red box of size 87x54 starting at (405, 105).
; PLAN: r0=405(x), r1=105(y), r2=87(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 105
LDI r2, 87
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
