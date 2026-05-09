; DESCRIPTION: Renders a yellow box of size 114x78 starting at (231, 177).
; PLAN: r0=231(x), r1=177(y), r2=114(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 177
LDI r2, 114
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
