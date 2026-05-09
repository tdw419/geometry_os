; DESCRIPTION: Places a orange 47x41 rectangle at position (459, 17).
; PLAN: r0=459(x), r1=17(y), r2=47(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 17
LDI r2, 47
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
