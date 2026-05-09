; DESCRIPTION: Places a yellow 24x54 rectangle at position (145, 28).
; PLAN: r0=145(x), r1=28(y), r2=24(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 28
LDI r2, 24
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
