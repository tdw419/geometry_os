; DESCRIPTION: Places a white 12x69 rectangle at position (228, 171).
; PLAN: r0=228(x), r1=171(y), r2=12(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 171
LDI r2, 12
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
