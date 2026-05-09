; DESCRIPTION: Places a white 46x115 rectangle at position (159, 115).
; PLAN: r0=159(x), r1=115(y), r2=46(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 115
LDI r2, 46
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
