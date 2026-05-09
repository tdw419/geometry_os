; DESCRIPTION: Draws a cyan rectangle at (242, 1) with width 64 and height 119.
; PLAN: r0=242(x), r1=1(y), r2=64(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 1
LDI r2, 64
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
