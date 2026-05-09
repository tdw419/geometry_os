; DESCRIPTION: Places a yellow 103x59 rectangle at position (28, 128).
; PLAN: r0=28(x), r1=128(y), r2=103(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 128
LDI r2, 103
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
