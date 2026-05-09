; DESCRIPTION: Places a red 120x84 rectangle at position (68, 1).
; PLAN: r0=68(x), r1=1(y), r2=120(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 1
LDI r2, 120
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
