; DESCRIPTION: Places a white 95x90 rectangle at position (115, 139).
; PLAN: r0=115(x), r1=139(y), r2=95(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 139
LDI r2, 95
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
