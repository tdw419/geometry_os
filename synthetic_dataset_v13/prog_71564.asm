; DESCRIPTION: Renders a black box of size 92x63 starting at (242, 173).
; PLAN: r0=242(x), r1=173(y), r2=92(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 173
LDI r2, 92
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
