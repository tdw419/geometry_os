; DESCRIPTION: Places a cyan 98x21 rectangle at position (250, 154).
; PLAN: r0=250(x), r1=154(y), r2=98(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 154
LDI r2, 98
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
