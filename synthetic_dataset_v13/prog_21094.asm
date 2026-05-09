; DESCRIPTION: Places a green 59x59 rectangle at position (166, 56).
; PLAN: r0=166(x), r1=56(y), r2=59(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 56
LDI r2, 59
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
