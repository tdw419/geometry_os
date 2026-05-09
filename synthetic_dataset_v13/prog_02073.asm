; DESCRIPTION: Places a white 111x92 rectangle at position (179, 69).
; PLAN: r0=179(x), r1=69(y), r2=111(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 69
LDI r2, 111
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
