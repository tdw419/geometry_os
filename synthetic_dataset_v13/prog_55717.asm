; DESCRIPTION: Renders a white box of size 61x50 starting at (14, 169).
; PLAN: r0=14(x), r1=169(y), r2=61(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 169
LDI r2, 61
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
