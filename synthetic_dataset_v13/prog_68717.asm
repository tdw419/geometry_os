; DESCRIPTION: Places a purple 28x31 rectangle at position (160, 154).
; PLAN: r0=160(x), r1=154(y), r2=28(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 154
LDI r2, 28
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
