; DESCRIPTION: Places a cyan 19x72 rectangle at position (22, 154).
; PLAN: r0=22(x), r1=154(y), r2=19(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 154
LDI r2, 19
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
