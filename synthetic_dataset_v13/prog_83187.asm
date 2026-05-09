; DESCRIPTION: Places a black 99x43 rectangle at position (408, 154).
; PLAN: r0=408(x), r1=154(y), r2=99(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 154
LDI r2, 99
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
