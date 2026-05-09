; DESCRIPTION: Places a yellow 96x64 rectangle at position (332, 154).
; PLAN: r0=332(x), r1=154(y), r2=96(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 154
LDI r2, 96
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
