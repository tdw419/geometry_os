; DESCRIPTION: Places a cyan 10x65 rectangle at position (56, 48).
; PLAN: r0=56(x), r1=48(y), r2=10(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 48
LDI r2, 10
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
