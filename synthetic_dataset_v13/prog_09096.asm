; DESCRIPTION: Renders a cyan box of size 114x80 starting at (227, 139).
; PLAN: r0=227(x), r1=139(y), r2=114(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 139
LDI r2, 114
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
