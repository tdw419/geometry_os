; DESCRIPTION: Places a white 18x105 rectangle at position (168, 18).
; PLAN: r0=168(x), r1=18(y), r2=18(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 18
LDI r2, 18
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
