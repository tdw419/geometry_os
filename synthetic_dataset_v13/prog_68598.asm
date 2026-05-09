; DESCRIPTION: Places a cyan 108x82 rectangle at position (325, 154).
; PLAN: r0=325(x), r1=154(y), r2=108(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 154
LDI r2, 108
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
