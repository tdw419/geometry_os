; DESCRIPTION: Renders a black box of size 72x102 starting at (242, 20).
; PLAN: r0=242(x), r1=20(y), r2=72(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 20
LDI r2, 72
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
