; DESCRIPTION: Places a white 74x55 rectangle at position (307, 154).
; PLAN: r0=307(x), r1=154(y), r2=74(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 154
LDI r2, 74
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
