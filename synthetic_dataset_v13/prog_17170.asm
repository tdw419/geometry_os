; DESCRIPTION: Places a white 120x117 rectangle at position (354, 25).
; PLAN: r0=354(x), r1=25(y), r2=120(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 25
LDI r2, 120
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
