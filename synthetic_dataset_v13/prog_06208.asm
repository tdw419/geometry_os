; DESCRIPTION: Places a green 48x32 rectangle at position (23, 188).
; PLAN: r0=23(x), r1=188(y), r2=48(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 188
LDI r2, 48
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
