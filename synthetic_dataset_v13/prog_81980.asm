; DESCRIPTION: Places a white 52x77 rectangle at position (408, 25).
; PLAN: r0=408(x), r1=25(y), r2=52(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 25
LDI r2, 52
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
