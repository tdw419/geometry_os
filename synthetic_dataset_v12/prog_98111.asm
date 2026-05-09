; DESCRIPTION: Renders a green box of size 36x69 starting at (293, 31).
; PLAN: r0=293(x), r1=31(y), r2=36(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 31
LDI r2, 36
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
