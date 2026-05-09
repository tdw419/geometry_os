; DESCRIPTION: Places a white 92x105 rectangle at position (247, 73).
; PLAN: r0=247(x), r1=73(y), r2=92(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 73
LDI r2, 92
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
