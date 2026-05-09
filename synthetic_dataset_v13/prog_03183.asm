; DESCRIPTION: Places a red 30x77 rectangle at position (151, 144).
; PLAN: r0=151(x), r1=144(y), r2=30(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 144
LDI r2, 30
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
