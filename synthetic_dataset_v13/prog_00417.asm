; DESCRIPTION: Places a orange 93x44 rectangle at position (413, 147).
; PLAN: r0=413(x), r1=147(y), r2=93(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 147
LDI r2, 93
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
