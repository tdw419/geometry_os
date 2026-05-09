; DESCRIPTION: Places a white 95x26 rectangle at position (246, 1).
; PLAN: r0=246(x), r1=1(y), r2=95(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 1
LDI r2, 95
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
