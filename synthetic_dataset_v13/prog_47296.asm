; DESCRIPTION: Places a white 109x92 rectangle at position (167, 39).
; PLAN: r0=167(x), r1=39(y), r2=109(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 39
LDI r2, 109
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
