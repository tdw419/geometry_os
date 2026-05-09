; DESCRIPTION: Places a white 57x98 rectangle at position (117, 12).
; PLAN: r0=117(x), r1=12(y), r2=57(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 12
LDI r2, 57
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
