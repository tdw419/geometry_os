; DESCRIPTION: Places a yellow 63x82 rectangle at position (43, 154).
; PLAN: r0=43(x), r1=154(y), r2=63(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 154
LDI r2, 63
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
