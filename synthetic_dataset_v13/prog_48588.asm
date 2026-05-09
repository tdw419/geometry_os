; DESCRIPTION: Places a red 120x75 rectangle at position (53, 45).
; PLAN: r0=53(x), r1=45(y), r2=120(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 45
LDI r2, 120
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
