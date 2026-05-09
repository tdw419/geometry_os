; DESCRIPTION: Places a purple 52x97 rectangle at position (357, 154).
; PLAN: r0=357(x), r1=154(y), r2=52(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 154
LDI r2, 52
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
