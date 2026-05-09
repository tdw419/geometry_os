; DESCRIPTION: Places a yellow 39x32 rectangle at position (224, 196).
; PLAN: r0=224(x), r1=196(y), r2=39(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 196
LDI r2, 39
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
