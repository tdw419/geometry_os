; DESCRIPTION: Places a white 46x28 rectangle at position (341, 64).
; PLAN: r0=341(x), r1=64(y), r2=46(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 64
LDI r2, 46
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
