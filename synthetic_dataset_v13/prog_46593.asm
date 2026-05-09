; DESCRIPTION: Renders a cyan box of size 90x102 starting at (202, 154).
; PLAN: r0=202(x), r1=154(y), r2=90(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 154
LDI r2, 90
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
