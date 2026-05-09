; DESCRIPTION: Places a orange 51x95 rectangle at position (10, 113).
; PLAN: r0=10(x), r1=113(y), r2=51(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 113
LDI r2, 51
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
