; DESCRIPTION: Renders a cyan box of size 19x105 starting at (138, 6).
; PLAN: r0=138(x), r1=6(y), r2=19(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 6
LDI r2, 19
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
