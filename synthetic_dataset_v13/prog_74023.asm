; DESCRIPTION: Places a orange 36x18 rectangle at position (40, 210).
; PLAN: r0=40(x), r1=210(y), r2=36(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 210
LDI r2, 36
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
