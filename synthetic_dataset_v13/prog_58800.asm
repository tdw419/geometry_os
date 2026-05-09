; DESCRIPTION: Places a red 100x44 rectangle at position (156, 209).
; PLAN: r0=156(x), r1=209(y), r2=100(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 209
LDI r2, 100
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
