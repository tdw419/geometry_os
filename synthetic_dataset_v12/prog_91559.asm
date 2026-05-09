; DESCRIPTION: Renders a black box of size 48x12 starting at (175, 242).
; PLAN: r0=175(x), r1=242(y), r2=48(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 242
LDI r2, 48
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
