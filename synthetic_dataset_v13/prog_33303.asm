; DESCRIPTION: Places a white 46x53 rectangle at position (2, 73).
; PLAN: r0=2(x), r1=73(y), r2=46(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 73
LDI r2, 46
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
