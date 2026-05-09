; DESCRIPTION: Places a orange 106x95 rectangle at position (82, 140).
; PLAN: r0=82(x), r1=140(y), r2=106(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 140
LDI r2, 106
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
