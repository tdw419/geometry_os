; DESCRIPTION: Places a white 14x28 rectangle at position (163, 164).
; PLAN: r0=163(x), r1=164(y), r2=14(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 164
LDI r2, 14
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
