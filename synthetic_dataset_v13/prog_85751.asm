; DESCRIPTION: Renders a white box of size 72x89 starting at (269, 91).
; PLAN: r0=269(x), r1=91(y), r2=72(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 91
LDI r2, 72
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
