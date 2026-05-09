; DESCRIPTION: Places a white 29x73 rectangle at position (332, 183).
; PLAN: r0=332(x), r1=183(y), r2=29(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 183
LDI r2, 29
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
