; DESCRIPTION: Draws a yellow rectangle at (446, 152) with width 22 and height 48.
; PLAN: r0=446(x), r1=152(y), r2=22(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 152
LDI r2, 22
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
