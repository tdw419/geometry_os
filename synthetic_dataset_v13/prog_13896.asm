; DESCRIPTION: Places a white 31x27 rectangle at position (469, 171).
; PLAN: r0=469(x), r1=171(y), r2=31(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 171
LDI r2, 31
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
