; DESCRIPTION: Places a red 45x61 rectangle at position (103, 37).
; PLAN: r0=103(x), r1=37(y), r2=45(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 37
LDI r2, 45
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
