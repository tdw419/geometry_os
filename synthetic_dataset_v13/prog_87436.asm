; DESCRIPTION: Places a orange 67x17 rectangle at position (147, 143).
; PLAN: r0=147(x), r1=143(y), r2=67(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 143
LDI r2, 67
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
