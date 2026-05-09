; DESCRIPTION: Places a white 92x30 rectangle at position (341, 114).
; PLAN: r0=341(x), r1=114(y), r2=92(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 114
LDI r2, 92
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
