; DESCRIPTION: Places a blue 99x99 rectangle at position (371, 154).
; PLAN: r0=371(x), r1=154(y), r2=99(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 154
LDI r2, 99
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
