; DESCRIPTION: Places a cyan 48x65 rectangle at position (22, 11).
; PLAN: r0=22(x), r1=11(y), r2=48(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 11
LDI r2, 48
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
