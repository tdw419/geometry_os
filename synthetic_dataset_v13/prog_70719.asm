; DESCRIPTION: Places a cyan 20x19 rectangle at position (47, 65).
; PLAN: r0=47(x), r1=65(y), r2=20(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 65
LDI r2, 20
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
