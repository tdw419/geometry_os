; DESCRIPTION: Places a green 13x90 rectangle at position (73, 128).
; PLAN: r0=73(x), r1=128(y), r2=13(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 128
LDI r2, 13
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
