; DESCRIPTION: Places a white 18x93 rectangle at position (320, 114).
; PLAN: r0=320(x), r1=114(y), r2=18(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 114
LDI r2, 18
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
