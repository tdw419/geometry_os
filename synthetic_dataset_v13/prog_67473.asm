; DESCRIPTION: Places a cyan 58x41 rectangle at position (13, 154).
; PLAN: r0=13(x), r1=154(y), r2=58(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 154
LDI r2, 58
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
