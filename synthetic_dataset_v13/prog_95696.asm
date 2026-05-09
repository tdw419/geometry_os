; DESCRIPTION: Places a orange 51x71 rectangle at position (160, 40).
; PLAN: r0=160(x), r1=40(y), r2=51(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 40
LDI r2, 51
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
