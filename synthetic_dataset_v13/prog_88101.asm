; DESCRIPTION: Places a orange 27x77 rectangle at position (281, 79).
; PLAN: r0=281(x), r1=79(y), r2=27(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 79
LDI r2, 27
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
