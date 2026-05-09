; DESCRIPTION: Places a orange 22x32 rectangle at position (360, 210).
; PLAN: r0=360(x), r1=210(y), r2=22(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 210
LDI r2, 22
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
