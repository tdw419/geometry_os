; DESCRIPTION: Places a orange 36x116 rectangle at position (318, 107).
; PLAN: r0=318(x), r1=107(y), r2=36(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 107
LDI r2, 36
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
