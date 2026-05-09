; DESCRIPTION: Places a orange 111x39 rectangle at position (167, 13).
; PLAN: r0=167(x), r1=13(y), r2=111(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 13
LDI r2, 111
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
