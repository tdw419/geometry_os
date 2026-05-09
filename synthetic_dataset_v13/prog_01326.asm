; DESCRIPTION: Places a white 66x23 rectangle at position (164, 228).
; PLAN: r0=164(x), r1=228(y), r2=66(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 228
LDI r2, 66
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
