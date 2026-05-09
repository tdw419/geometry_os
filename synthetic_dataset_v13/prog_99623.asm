; DESCRIPTION: Places a yellow 50x86 rectangle at position (248, 154).
; PLAN: r0=248(x), r1=154(y), r2=50(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 154
LDI r2, 50
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
