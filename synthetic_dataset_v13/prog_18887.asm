; DESCRIPTION: Renders a white box of size 61x79 starting at (61, 8).
; PLAN: r0=61(x), r1=8(y), r2=61(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 8
LDI r2, 61
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
