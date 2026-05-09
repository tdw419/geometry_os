; DESCRIPTION: Places a white 105x47 rectangle at position (385, 115).
; PLAN: r0=385(x), r1=115(y), r2=105(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 115
LDI r2, 105
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
