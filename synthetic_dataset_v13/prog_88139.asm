; DESCRIPTION: Places a white 89x73 rectangle at position (281, 171).
; PLAN: r0=281(x), r1=171(y), r2=89(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 171
LDI r2, 89
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
