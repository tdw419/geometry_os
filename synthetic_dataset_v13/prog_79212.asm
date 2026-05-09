; DESCRIPTION: Places a white 117x107 rectangle at position (168, 58).
; PLAN: r0=168(x), r1=58(y), r2=117(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 58
LDI r2, 117
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
