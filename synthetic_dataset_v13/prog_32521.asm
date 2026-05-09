; DESCRIPTION: Places a orange 27x74 rectangle at position (166, 86).
; PLAN: r0=166(x), r1=86(y), r2=27(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 86
LDI r2, 27
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
