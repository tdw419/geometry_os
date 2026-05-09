; DESCRIPTION: Places a white 90x107 rectangle at position (117, 127).
; PLAN: r0=117(x), r1=127(y), r2=90(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 127
LDI r2, 90
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
