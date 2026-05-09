; DESCRIPTION: Places a orange 46x50 rectangle at position (213, 158).
; PLAN: r0=213(x), r1=158(y), r2=46(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 158
LDI r2, 46
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
