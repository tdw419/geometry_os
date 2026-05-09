; DESCRIPTION: Renders a white box of size 108x72 starting at (231, 125).
; PLAN: r0=231(x), r1=125(y), r2=108(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 125
LDI r2, 108
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
