; DESCRIPTION: Places a red 88x109 rectangle at position (68, 16).
; PLAN: r0=68(x), r1=16(y), r2=88(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 16
LDI r2, 88
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
