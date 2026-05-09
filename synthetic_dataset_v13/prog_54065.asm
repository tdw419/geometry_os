; DESCRIPTION: Places a orange 48x112 rectangle at position (345, 52).
; PLAN: r0=345(x), r1=52(y), r2=48(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 52
LDI r2, 48
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
