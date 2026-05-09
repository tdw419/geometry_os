; DESCRIPTION: Places a orange 47x50 rectangle at position (302, 0).
; PLAN: r0=302(x), r1=0(y), r2=47(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 0
LDI r2, 47
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
