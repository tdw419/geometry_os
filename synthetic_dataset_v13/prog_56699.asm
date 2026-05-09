; DESCRIPTION: Places a orange 65x25 rectangle at position (33, 71).
; PLAN: r0=33(x), r1=71(y), r2=65(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 71
LDI r2, 65
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
