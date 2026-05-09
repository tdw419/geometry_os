; DESCRIPTION: Renders a black box of size 115x72 starting at (242, 40).
; PLAN: r0=242(x), r1=40(y), r2=115(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 40
LDI r2, 115
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
