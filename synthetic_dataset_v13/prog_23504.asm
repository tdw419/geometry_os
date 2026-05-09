; DESCRIPTION: Places a white 53x65 rectangle at position (30, 86).
; PLAN: r0=30(x), r1=86(y), r2=53(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 86
LDI r2, 53
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
