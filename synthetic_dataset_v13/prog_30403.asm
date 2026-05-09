; DESCRIPTION: Places a black 39x37 rectangle at position (365, 154).
; PLAN: r0=365(x), r1=154(y), r2=39(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 154
LDI r2, 39
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
