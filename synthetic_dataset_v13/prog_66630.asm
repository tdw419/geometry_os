; DESCRIPTION: Places a white 11x26 rectangle at position (450, 127).
; PLAN: r0=450(x), r1=127(y), r2=11(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 127
LDI r2, 11
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
