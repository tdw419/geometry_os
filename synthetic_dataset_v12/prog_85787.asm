; DESCRIPTION: Places a white 92x72 rectangle at position (291, 182).
; PLAN: r0=291(x), r1=182(y), r2=92(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 182
LDI r2, 92
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
