; DESCRIPTION: Renders a white box of size 70x61 starting at (171, 48).
; PLAN: r0=171(x), r1=48(y), r2=70(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 48
LDI r2, 70
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
