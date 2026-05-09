; DESCRIPTION: Places a black 74x83 rectangle at position (4, 154).
; PLAN: r0=4(x), r1=154(y), r2=74(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 154
LDI r2, 74
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
