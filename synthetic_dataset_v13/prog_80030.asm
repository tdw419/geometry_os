; DESCRIPTION: Renders a white box of size 68x48 starting at (231, 72).
; PLAN: r0=231(x), r1=72(y), r2=68(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 72
LDI r2, 68
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
