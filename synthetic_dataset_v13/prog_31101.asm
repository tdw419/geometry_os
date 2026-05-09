; DESCRIPTION: Places a cyan 68x86 rectangle at position (37, 154).
; PLAN: r0=37(x), r1=154(y), r2=68(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 154
LDI r2, 68
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
