; DESCRIPTION: Places a white 24x43 rectangle at position (228, 132).
; PLAN: r0=228(x), r1=132(y), r2=24(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 132
LDI r2, 24
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
