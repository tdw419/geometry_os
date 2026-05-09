; DESCRIPTION: Places a orange 112x77 rectangle at position (381, 5).
; PLAN: r0=381(x), r1=5(y), r2=112(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 5
LDI r2, 112
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
