; DESCRIPTION: Places a white 49x86 rectangle at position (89, 28).
; PLAN: r0=89(x), r1=28(y), r2=49(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 28
LDI r2, 49
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
