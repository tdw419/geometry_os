; DESCRIPTION: Places a magenta 41x83 rectangle at position (243, 59).
; PLAN: r0=243(x), r1=59(y), r2=41(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 59
LDI r2, 41
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
