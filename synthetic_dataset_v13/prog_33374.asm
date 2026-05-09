; DESCRIPTION: Places a orange 110x22 rectangle at position (0, 154).
; PLAN: r0=0(x), r1=154(y), r2=110(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 154
LDI r2, 110
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
