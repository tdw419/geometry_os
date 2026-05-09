; DESCRIPTION: Places a yellow 10x99 rectangle at position (59, 24).
; PLAN: r0=59(x), r1=24(y), r2=10(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 24
LDI r2, 10
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
