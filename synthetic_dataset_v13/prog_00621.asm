; DESCRIPTION: Places a orange 46x115 rectangle at position (430, 17).
; PLAN: r0=430(x), r1=17(y), r2=46(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 17
LDI r2, 46
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
