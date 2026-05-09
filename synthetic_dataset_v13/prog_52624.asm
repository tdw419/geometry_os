; DESCRIPTION: Places a white 21x29 rectangle at position (157, 18).
; PLAN: r0=157(x), r1=18(y), r2=21(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 18
LDI r2, 21
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
