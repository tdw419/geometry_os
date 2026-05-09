; DESCRIPTION: Places a orange 92x54 rectangle at position (85, 154).
; PLAN: r0=85(x), r1=154(y), r2=92(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 154
LDI r2, 92
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
