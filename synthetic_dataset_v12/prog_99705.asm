; DESCRIPTION: Places a white 78x95 rectangle at position (157, 91).
; PLAN: r0=157(x), r1=91(y), r2=78(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 91
LDI r2, 78
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
