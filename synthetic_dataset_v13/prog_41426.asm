; DESCRIPTION: Places a red 14x77 rectangle at position (356, 159).
; PLAN: r0=356(x), r1=159(y), r2=14(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 159
LDI r2, 14
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
