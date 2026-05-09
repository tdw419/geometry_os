; DESCRIPTION: Places a red 60x103 rectangle at position (425, 139).
; PLAN: r0=425(x), r1=139(y), r2=60(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 139
LDI r2, 60
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
