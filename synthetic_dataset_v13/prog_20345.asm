; DESCRIPTION: Places a orange 107x91 rectangle at position (166, 151).
; PLAN: r0=166(x), r1=151(y), r2=107(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 151
LDI r2, 107
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
