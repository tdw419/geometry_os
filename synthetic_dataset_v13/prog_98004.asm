; DESCRIPTION: Places a white 48x84 rectangle at position (97, 154).
; PLAN: r0=97(x), r1=154(y), r2=48(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 154
LDI r2, 48
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
