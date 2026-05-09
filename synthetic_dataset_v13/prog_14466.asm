; DESCRIPTION: Renders a purple box of size 92x57 starting at (188, 154).
; PLAN: r0=188(x), r1=154(y), r2=92(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 154
LDI r2, 92
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
