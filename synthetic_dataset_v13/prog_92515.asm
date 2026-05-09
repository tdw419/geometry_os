; DESCRIPTION: Places a white 81x27 rectangle at position (155, 210).
; PLAN: r0=155(x), r1=210(y), r2=81(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 210
LDI r2, 81
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
