; DESCRIPTION: Places a red 11x71 rectangle at position (83, 135).
; PLAN: r0=83(x), r1=135(y), r2=11(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 135
LDI r2, 11
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
