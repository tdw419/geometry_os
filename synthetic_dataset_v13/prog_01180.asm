; DESCRIPTION: Places a orange 116x36 rectangle at position (177, 44).
; PLAN: r0=177(x), r1=44(y), r2=116(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 44
LDI r2, 116
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
