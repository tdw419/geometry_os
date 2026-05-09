; DESCRIPTION: Renders a white box of size 48x87 starting at (246, 133).
; PLAN: r0=246(x), r1=133(y), r2=48(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 133
LDI r2, 48
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
