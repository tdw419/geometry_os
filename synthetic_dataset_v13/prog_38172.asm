; DESCRIPTION: Places a orange 74x48 rectangle at position (303, 132).
; PLAN: r0=303(x), r1=132(y), r2=74(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 132
LDI r2, 74
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
