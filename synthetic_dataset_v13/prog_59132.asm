; DESCRIPTION: Places a orange 112x21 rectangle at position (276, 231).
; PLAN: r0=276(x), r1=231(y), r2=112(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 231
LDI r2, 112
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
