; DESCRIPTION: Places a yellow 114x78 rectangle at position (173, 40).
; PLAN: r0=173(x), r1=40(y), r2=114(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 40
LDI r2, 114
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
