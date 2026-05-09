; DESCRIPTION: Places a orange 47x25 rectangle at position (230, 126).
; PLAN: r0=230(x), r1=126(y), r2=47(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 126
LDI r2, 47
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
