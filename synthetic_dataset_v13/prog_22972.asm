; DESCRIPTION: Draws a cyan rectangle at (242, 1) with width 24 and height 22.
; PLAN: r0=242(x), r1=1(y), r2=24(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 1
LDI r2, 24
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
