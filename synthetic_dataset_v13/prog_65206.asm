; DESCRIPTION: Places a cyan 99x20 rectangle at position (225, 64).
; PLAN: r0=225(x), r1=64(y), r2=99(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 64
LDI r2, 99
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
