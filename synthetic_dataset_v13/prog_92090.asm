; DESCRIPTION: Renders a green box of size 38x102 starting at (465, 154).
; PLAN: r0=465(x), r1=154(y), r2=38(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 154
LDI r2, 38
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
