; DESCRIPTION: Places a white 113x78 rectangle at position (199, 57).
; PLAN: r0=199(x), r1=57(y), r2=113(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 57
LDI r2, 113
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
