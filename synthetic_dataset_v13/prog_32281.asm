; DESCRIPTION: Places a red 64x105 rectangle at position (202, 56).
; PLAN: r0=202(x), r1=56(y), r2=64(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 56
LDI r2, 64
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
