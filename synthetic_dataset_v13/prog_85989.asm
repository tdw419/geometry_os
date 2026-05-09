; DESCRIPTION: Places a white 73x102 rectangle at position (171, 3).
; PLAN: r0=171(x), r1=3(y), r2=73(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 3
LDI r2, 73
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
