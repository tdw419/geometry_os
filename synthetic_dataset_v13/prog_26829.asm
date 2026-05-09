; DESCRIPTION: Places a orange 29x50 rectangle at position (208, 46).
; PLAN: r0=208(x), r1=46(y), r2=29(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 46
LDI r2, 29
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
