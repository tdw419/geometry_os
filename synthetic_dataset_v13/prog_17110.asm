; DESCRIPTION: Places a white 98x71 rectangle at position (340, 122).
; PLAN: r0=340(x), r1=122(y), r2=98(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 122
LDI r2, 98
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
