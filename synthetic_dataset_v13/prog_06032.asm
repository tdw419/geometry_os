; DESCRIPTION: Places a white 46x19 rectangle at position (194, 43).
; PLAN: r0=194(x), r1=43(y), r2=46(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 43
LDI r2, 46
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
