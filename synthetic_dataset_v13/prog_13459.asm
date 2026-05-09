; DESCRIPTION: Places a white 99x21 rectangle at position (155, 141).
; PLAN: r0=155(x), r1=141(y), r2=99(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 141
LDI r2, 99
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
