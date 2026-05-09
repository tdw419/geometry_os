; DESCRIPTION: Places a orange 65x38 rectangle at position (260, 154).
; PLAN: r0=260(x), r1=154(y), r2=65(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 154
LDI r2, 65
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
