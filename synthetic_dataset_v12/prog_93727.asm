; DESCRIPTION: Places a white 86x14 rectangle at position (246, 159).
; PLAN: r0=246(x), r1=159(y), r2=86(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 159
LDI r2, 86
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
