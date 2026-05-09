; DESCRIPTION: Places a orange 15x91 rectangle at position (374, 104).
; PLAN: r0=374(x), r1=104(y), r2=15(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 104
LDI r2, 15
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
