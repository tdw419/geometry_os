; DESCRIPTION: Places a white 31x30 rectangle at position (171, 113).
; PLAN: r0=171(x), r1=113(y), r2=31(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 113
LDI r2, 31
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
