; DESCRIPTION: Places a white 56x63 rectangle at position (442, 138).
; PLAN: r0=442(x), r1=138(y), r2=56(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 138
LDI r2, 56
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
