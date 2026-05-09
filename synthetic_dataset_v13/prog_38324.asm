; DESCRIPTION: Places a yellow 83x90 rectangle at position (40, 29).
; PLAN: r0=40(x), r1=29(y), r2=83(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 29
LDI r2, 83
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
