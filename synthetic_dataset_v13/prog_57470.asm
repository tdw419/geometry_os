; DESCRIPTION: Places a orange 24x31 rectangle at position (271, 59).
; PLAN: r0=271(x), r1=59(y), r2=24(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 59
LDI r2, 24
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
