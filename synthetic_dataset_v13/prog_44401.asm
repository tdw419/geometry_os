; DESCRIPTION: Places a orange 36x86 rectangle at position (276, 8).
; PLAN: r0=276(x), r1=8(y), r2=36(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 8
LDI r2, 36
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
