; DESCRIPTION: Places a yellow 17x48 rectangle at position (480, 90).
; PLAN: r0=480(x), r1=90(y), r2=17(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 90
LDI r2, 17
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
