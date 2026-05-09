; DESCRIPTION: Renders a green box of size 46x50 starting at (33, 154).
; PLAN: r0=33(x), r1=154(y), r2=46(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 154
LDI r2, 46
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
