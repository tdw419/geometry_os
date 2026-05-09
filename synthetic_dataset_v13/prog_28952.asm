; DESCRIPTION: Places a white 96x98 rectangle at position (333, 69).
; PLAN: r0=333(x), r1=69(y), r2=96(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 69
LDI r2, 96
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
