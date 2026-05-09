; DESCRIPTION: Places a white 24x72 rectangle at position (105, 148).
; PLAN: r0=105(x), r1=148(y), r2=24(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 148
LDI r2, 24
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
