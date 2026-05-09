; DESCRIPTION: Places a yellow 68x28 rectangle at position (203, 125).
; PLAN: r0=203(x), r1=125(y), r2=68(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 125
LDI r2, 68
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
