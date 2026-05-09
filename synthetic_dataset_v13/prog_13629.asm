; DESCRIPTION: Places a red 50x77 rectangle at position (67, 141).
; PLAN: r0=67(x), r1=141(y), r2=50(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 141
LDI r2, 50
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
