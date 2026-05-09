; DESCRIPTION: Renders a white box of size 117x29 starting at (233, 143).
; PLAN: r0=233(x), r1=143(y), r2=117(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 143
LDI r2, 117
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
