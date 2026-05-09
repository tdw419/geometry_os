; DESCRIPTION: Renders a yellow box of size 120x100 starting at (335, 154).
; PLAN: r0=335(x), r1=154(y), r2=120(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 154
LDI r2, 120
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
