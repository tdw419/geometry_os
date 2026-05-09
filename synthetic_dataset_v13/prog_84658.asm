; DESCRIPTION: Renders a white box of size 102x23 starting at (196, 7).
; PLAN: r0=196(x), r1=7(y), r2=102(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 7
LDI r2, 102
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
