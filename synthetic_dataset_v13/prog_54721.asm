; DESCRIPTION: Places a purple 98x13 rectangle at position (145, 154).
; PLAN: r0=145(x), r1=154(y), r2=98(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 154
LDI r2, 98
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
