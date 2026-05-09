; DESCRIPTION: Places a yellow 105x18 rectangle at position (175, 169).
; PLAN: r0=175(x), r1=169(y), r2=105(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 169
LDI r2, 105
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
