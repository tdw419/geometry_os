; DESCRIPTION: Places a white 24x103 rectangle at position (264, 43).
; PLAN: r0=264(x), r1=43(y), r2=24(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 43
LDI r2, 24
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
