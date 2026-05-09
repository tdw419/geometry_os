; DESCRIPTION: Renders a blue box of size 107x91 starting at (242, 19).
; PLAN: r0=242(x), r1=19(y), r2=107(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 19
LDI r2, 107
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
