; DESCRIPTION: Places a white 80x28 rectangle at position (21, 101).
; PLAN: r0=21(x), r1=101(y), r2=80(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 101
LDI r2, 80
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
