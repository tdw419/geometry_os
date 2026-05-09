; DESCRIPTION: Places a white 105x38 rectangle at position (132, 165).
; PLAN: r0=132(x), r1=165(y), r2=105(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 165
LDI r2, 105
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
