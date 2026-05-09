; DESCRIPTION: Places a orange 78x39 rectangle at position (410, 210).
; PLAN: r0=410(x), r1=210(y), r2=78(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 210
LDI r2, 78
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
