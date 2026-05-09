; DESCRIPTION: Places a white 33x105 rectangle at position (149, 134).
; PLAN: r0=149(x), r1=134(y), r2=33(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 134
LDI r2, 33
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
