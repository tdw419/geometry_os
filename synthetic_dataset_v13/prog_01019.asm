; DESCRIPTION: Places a orange 46x107 rectangle at position (350, 139).
; PLAN: r0=350(x), r1=139(y), r2=46(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 139
LDI r2, 46
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
