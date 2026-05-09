; DESCRIPTION: Renders a red box of size 98x54 starting at (293, 137).
; PLAN: r0=293(x), r1=137(y), r2=98(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 137
LDI r2, 98
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
