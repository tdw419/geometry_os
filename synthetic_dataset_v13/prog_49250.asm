; DESCRIPTION: Places a white 85x46 rectangle at position (52, 46).
; PLAN: r0=52(x), r1=46(y), r2=85(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 46
LDI r2, 85
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
