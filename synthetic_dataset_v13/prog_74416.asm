; DESCRIPTION: Places a orange 114x72 rectangle at position (237, 71).
; PLAN: r0=237(x), r1=71(y), r2=114(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 71
LDI r2, 114
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
