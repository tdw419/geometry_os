; DESCRIPTION: Places a white 113x73 rectangle at position (164, 119).
; PLAN: r0=164(x), r1=119(y), r2=113(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 119
LDI r2, 113
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
