; DESCRIPTION: Places a white 46x71 rectangle at position (375, 85).
; PLAN: r0=375(x), r1=85(y), r2=46(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 85
LDI r2, 46
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
