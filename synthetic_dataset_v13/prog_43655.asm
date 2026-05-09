; DESCRIPTION: Places a red 28x82 rectangle at position (70, 77).
; PLAN: r0=70(x), r1=77(y), r2=28(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 77
LDI r2, 28
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
