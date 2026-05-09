; DESCRIPTION: Places a orange 88x55 rectangle at position (196, 154).
; PLAN: r0=196(x), r1=154(y), r2=88(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 154
LDI r2, 88
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
