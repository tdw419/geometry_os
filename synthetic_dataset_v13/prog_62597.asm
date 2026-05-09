; DESCRIPTION: Places a white 61x26 rectangle at position (136, 132).
; PLAN: r0=136(x), r1=132(y), r2=61(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 132
LDI r2, 61
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
