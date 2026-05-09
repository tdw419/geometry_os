; DESCRIPTION: Renders a green box of size 14x113 starting at (291, 132).
; PLAN: r0=291(x), r1=132(y), r2=14(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 132
LDI r2, 14
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
