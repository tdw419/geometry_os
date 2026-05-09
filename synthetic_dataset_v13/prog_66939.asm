; DESCRIPTION: Places a red 109x11 rectangle at position (207, 32).
; PLAN: r0=207(x), r1=32(y), r2=109(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 32
LDI r2, 109
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
