; DESCRIPTION: Places a white 30x57 rectangle at position (16, 184).
; PLAN: r0=16(x), r1=184(y), r2=30(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 184
LDI r2, 30
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
