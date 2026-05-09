; DESCRIPTION: Renders a white box of size 117x75 starting at (300, 133).
; PLAN: r0=300(x), r1=133(y), r2=117(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 133
LDI r2, 117
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
