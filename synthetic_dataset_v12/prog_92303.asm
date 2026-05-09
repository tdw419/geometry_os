; DESCRIPTION: Places a red 72x107 rectangle at position (85, 4).
; PLAN: r0=85(x), r1=4(y), r2=72(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 4
LDI r2, 72
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
