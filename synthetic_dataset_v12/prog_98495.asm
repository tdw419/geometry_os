; DESCRIPTION: Places a white 114x48 rectangle at position (153, 181).
; PLAN: r0=153(x), r1=181(y), r2=114(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 181
LDI r2, 114
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
