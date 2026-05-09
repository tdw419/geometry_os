; DESCRIPTION: Places a yellow 15x10 rectangle at position (474, 40).
; PLAN: r0=474(x), r1=40(y), r2=15(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 40
LDI r2, 15
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
