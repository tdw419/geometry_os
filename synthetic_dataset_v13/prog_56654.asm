; DESCRIPTION: Places a white 114x17 rectangle at position (28, 46).
; PLAN: r0=28(x), r1=46(y), r2=114(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 46
LDI r2, 114
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
