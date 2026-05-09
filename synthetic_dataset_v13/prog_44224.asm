; DESCRIPTION: Places a white 99x27 rectangle at position (205, 203).
; PLAN: r0=205(x), r1=203(y), r2=99(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 203
LDI r2, 99
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
