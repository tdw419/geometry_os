; DESCRIPTION: Places a white 101x78 rectangle at position (113, 86).
; PLAN: r0=113(x), r1=86(y), r2=101(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 86
LDI r2, 101
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
