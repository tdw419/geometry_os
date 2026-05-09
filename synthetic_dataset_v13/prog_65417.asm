; DESCRIPTION: Renders a white box of size 44x76 starting at (207, 16).
; PLAN: r0=207(x), r1=16(y), r2=44(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 16
LDI r2, 44
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
