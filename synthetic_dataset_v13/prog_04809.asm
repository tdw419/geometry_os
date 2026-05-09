; DESCRIPTION: Places a orange 82x54 rectangle at position (367, 169).
; PLAN: r0=367(x), r1=169(y), r2=82(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 169
LDI r2, 82
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
