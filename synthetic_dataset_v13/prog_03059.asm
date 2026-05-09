; DESCRIPTION: Renders a cyan box of size 97x114 starting at (236, 62).
; PLAN: r0=236(x), r1=62(y), r2=97(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 62
LDI r2, 97
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
