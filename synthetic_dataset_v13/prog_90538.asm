; DESCRIPTION: Places a red 44x101 rectangle at position (114, 154).
; PLAN: r0=114(x), r1=154(y), r2=44(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 154
LDI r2, 44
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
