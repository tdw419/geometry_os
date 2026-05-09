; DESCRIPTION: Places a green 25x77 rectangle at position (151, 75).
; PLAN: r0=151(x), r1=75(y), r2=25(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 75
LDI r2, 25
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
