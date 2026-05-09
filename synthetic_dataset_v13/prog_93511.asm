; DESCRIPTION: Renders a cyan box of size 88x12 starting at (286, 227).
; PLAN: r0=286(x), r1=227(y), r2=88(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 227
LDI r2, 88
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
