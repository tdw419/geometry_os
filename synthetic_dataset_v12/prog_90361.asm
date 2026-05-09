; DESCRIPTION: Places a blue 23x19 rectangle at position (286, 154).
; PLAN: r0=286(x), r1=154(y), r2=23(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 154
LDI r2, 23
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
