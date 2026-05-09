; DESCRIPTION: Places a white 98x23 rectangle at position (8, 28).
; PLAN: r0=8(x), r1=28(y), r2=98(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 28
LDI r2, 98
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
