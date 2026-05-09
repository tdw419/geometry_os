; DESCRIPTION: Places a orange 106x59 rectangle at position (317, 90).
; PLAN: r0=317(x), r1=90(y), r2=106(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 90
LDI r2, 106
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
