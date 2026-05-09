; DESCRIPTION: Places a cyan 65x16 rectangle at position (109, 20).
; PLAN: r0=109(x), r1=20(y), r2=65(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 20
LDI r2, 65
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
