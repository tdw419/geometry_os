; DESCRIPTION: Places a black 70x95 rectangle at position (297, 154).
; PLAN: r0=297(x), r1=154(y), r2=70(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 154
LDI r2, 70
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
