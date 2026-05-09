; DESCRIPTION: Renders a cyan box of size 52x69 starting at (109, 22).
; PLAN: r0=109(x), r1=22(y), r2=52(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 22
LDI r2, 52
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
