; DESCRIPTION: Places a white 32x39 rectangle at position (7, 82).
; PLAN: r0=7(x), r1=82(y), r2=32(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 82
LDI r2, 32
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
