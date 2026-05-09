; DESCRIPTION: Renders a cyan box of size 114x20 starting at (43, 22).
; PLAN: r0=43(x), r1=22(y), r2=114(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 22
LDI r2, 114
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
