; DESCRIPTION: Places a white 60x113 rectangle at position (73, 69).
; PLAN: r0=73(x), r1=69(y), r2=60(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 69
LDI r2, 60
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
