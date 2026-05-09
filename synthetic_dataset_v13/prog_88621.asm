; DESCRIPTION: Places a yellow 54x40 rectangle at position (454, 135).
; PLAN: r0=454(x), r1=135(y), r2=54(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 135
LDI r2, 54
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
