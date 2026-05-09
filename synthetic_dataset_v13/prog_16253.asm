; DESCRIPTION: Renders a cyan box of size 58x72 starting at (55, 154).
; PLAN: r0=55(x), r1=154(y), r2=58(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 154
LDI r2, 58
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
