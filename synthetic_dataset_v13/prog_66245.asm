; DESCRIPTION: Places a white 72x119 rectangle at position (171, 112).
; PLAN: r0=171(x), r1=112(y), r2=72(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 112
LDI r2, 72
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
