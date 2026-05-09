; DESCRIPTION: Places a orange 107x20 rectangle at position (328, 57).
; PLAN: r0=328(x), r1=57(y), r2=107(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 57
LDI r2, 107
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
