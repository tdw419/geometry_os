; DESCRIPTION: Places a white 14x68 rectangle at position (19, 127).
; PLAN: r0=19(x), r1=127(y), r2=14(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 127
LDI r2, 14
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
