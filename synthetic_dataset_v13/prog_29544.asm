; DESCRIPTION: Renders a red box of size 94x105 starting at (405, 2).
; PLAN: r0=405(x), r1=2(y), r2=94(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 2
LDI r2, 94
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
