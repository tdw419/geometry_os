; DESCRIPTION: Places a orange 26x65 rectangle at position (52, 186).
; PLAN: r0=52(x), r1=186(y), r2=26(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 186
LDI r2, 26
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
