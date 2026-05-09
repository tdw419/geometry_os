; DESCRIPTION: Places a red 36x87 rectangle at position (455, 154).
; PLAN: r0=455(x), r1=154(y), r2=36(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 154
LDI r2, 36
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
