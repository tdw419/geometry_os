; DESCRIPTION: Places a red 56x33 rectangle at position (350, 203).
; PLAN: r0=350(x), r1=203(y), r2=56(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 203
LDI r2, 56
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
