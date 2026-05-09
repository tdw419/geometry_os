; DESCRIPTION: Places a white 66x116 rectangle at position (76, 95).
; PLAN: r0=76(x), r1=95(y), r2=66(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 95
LDI r2, 66
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
