; DESCRIPTION: Places a white 53x95 rectangle at position (251, 8).
; PLAN: r0=251(x), r1=8(y), r2=53(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 8
LDI r2, 53
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
