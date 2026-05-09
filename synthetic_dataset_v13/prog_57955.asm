; DESCRIPTION: Places a red 18x56 rectangle at position (346, 24).
; PLAN: r0=346(x), r1=24(y), r2=18(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 24
LDI r2, 18
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
