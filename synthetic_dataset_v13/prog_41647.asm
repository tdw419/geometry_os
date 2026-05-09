; DESCRIPTION: Places a red 68x100 rectangle at position (332, 44).
; PLAN: r0=332(x), r1=44(y), r2=68(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 44
LDI r2, 68
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
