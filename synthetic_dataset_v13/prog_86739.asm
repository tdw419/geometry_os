; DESCRIPTION: Places a red 113x110 rectangle at position (64, 138).
; PLAN: r0=64(x), r1=138(y), r2=113(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 138
LDI r2, 113
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
