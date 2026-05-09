; DESCRIPTION: Draws a red rectangle at (242, 59) with width 58 and height 11.
; PLAN: r0=242(x), r1=59(y), r2=58(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 59
LDI r2, 58
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
