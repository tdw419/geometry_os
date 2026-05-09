; DESCRIPTION: Places a orange 59x25 rectangle at position (279, 203).
; PLAN: r0=279(x), r1=203(y), r2=59(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 203
LDI r2, 59
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
