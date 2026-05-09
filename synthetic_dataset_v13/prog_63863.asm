; DESCRIPTION: Places a white 89x71 rectangle at position (367, 153).
; PLAN: r0=367(x), r1=153(y), r2=89(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 153
LDI r2, 89
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
