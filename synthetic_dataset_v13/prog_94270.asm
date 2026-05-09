; DESCRIPTION: Places a cyan 85x48 rectangle at position (40, 160).
; PLAN: r0=40(x), r1=160(y), r2=85(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 160
LDI r2, 85
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
