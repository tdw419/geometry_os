; DESCRIPTION: Places a orange 37x90 rectangle at position (310, 164).
; PLAN: r0=310(x), r1=164(y), r2=37(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 164
LDI r2, 37
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
