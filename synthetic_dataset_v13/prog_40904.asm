; DESCRIPTION: Places a orange 59x51 rectangle at position (330, 134).
; PLAN: r0=330(x), r1=134(y), r2=59(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 134
LDI r2, 59
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
