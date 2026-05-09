; DESCRIPTION: Renders a cyan box of size 88x83 starting at (175, 113).
; PLAN: r0=175(x), r1=113(y), r2=88(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 113
LDI r2, 88
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
