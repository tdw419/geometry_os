; DESCRIPTION: Places a orange 114x61 rectangle at position (260, 103).
; PLAN: r0=260(x), r1=103(y), r2=114(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 103
LDI r2, 114
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
