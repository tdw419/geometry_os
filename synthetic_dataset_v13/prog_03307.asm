; DESCRIPTION: Places a white 95x83 rectangle at position (24, 134).
; PLAN: r0=24(x), r1=134(y), r2=95(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 134
LDI r2, 95
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
