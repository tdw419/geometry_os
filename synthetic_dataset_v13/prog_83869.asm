; DESCRIPTION: Places a orange 37x74 rectangle at position (60, 107).
; PLAN: r0=60(x), r1=107(y), r2=37(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 107
LDI r2, 37
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
