; DESCRIPTION: Places a white 102x55 rectangle at position (265, 11).
; PLAN: r0=265(x), r1=11(y), r2=102(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 11
LDI r2, 102
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
