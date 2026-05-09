; DESCRIPTION: Places a orange 51x88 rectangle at position (437, 154).
; PLAN: r0=437(x), r1=154(y), r2=51(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 154
LDI r2, 51
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
