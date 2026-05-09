; DESCRIPTION: Places a orange 65x68 rectangle at position (322, 9).
; PLAN: r0=322(x), r1=9(y), r2=65(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 9
LDI r2, 65
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
