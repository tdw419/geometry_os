; DESCRIPTION: Places a orange 27x37 rectangle at position (57, 210).
; PLAN: r0=57(x), r1=210(y), r2=27(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 210
LDI r2, 27
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
