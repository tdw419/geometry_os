; DESCRIPTION: Places a yellow 80x30 rectangle at position (111, 12).
; PLAN: r0=111(x), r1=12(y), r2=80(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 12
LDI r2, 80
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
