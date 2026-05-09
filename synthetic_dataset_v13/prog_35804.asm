; DESCRIPTION: Renders a cyan box of size 30x96 starting at (411, 154).
; PLAN: r0=411(x), r1=154(y), r2=30(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 154
LDI r2, 30
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
