; DESCRIPTION: Places a magenta 46x70 rectangle at position (414, 154).
; PLAN: r0=414(x), r1=154(y), r2=46(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 154
LDI r2, 46
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
