; DESCRIPTION: Places a white 76x60 rectangle at position (211, 195).
; PLAN: r0=211(x), r1=195(y), r2=76(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 195
LDI r2, 76
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
