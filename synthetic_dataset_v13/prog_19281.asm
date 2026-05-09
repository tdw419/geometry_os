; DESCRIPTION: Places a orange 99x105 rectangle at position (305, 59).
; PLAN: r0=305(x), r1=59(y), r2=99(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 59
LDI r2, 99
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
