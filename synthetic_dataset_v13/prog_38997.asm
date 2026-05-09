; DESCRIPTION: Places a orange 39x55 rectangle at position (358, 59).
; PLAN: r0=358(x), r1=59(y), r2=39(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 59
LDI r2, 39
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
