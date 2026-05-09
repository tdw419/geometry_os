; DESCRIPTION: Renders a cyan box of size 62x113 starting at (26, 81).
; PLAN: r0=26(x), r1=81(y), r2=62(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 81
LDI r2, 62
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
