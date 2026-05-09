; DESCRIPTION: Renders a blue box of size 116x82 starting at (295, 61).
; PLAN: r0=295(x), r1=61(y), r2=116(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 61
LDI r2, 116
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
