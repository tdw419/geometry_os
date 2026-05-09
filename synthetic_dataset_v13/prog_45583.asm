; DESCRIPTION: Places a orange 96x91 rectangle at position (366, 60).
; PLAN: r0=366(x), r1=60(y), r2=96(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 60
LDI r2, 96
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
