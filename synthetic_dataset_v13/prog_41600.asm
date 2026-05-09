; DESCRIPTION: Places a cyan 22x20 rectangle at position (306, 185).
; PLAN: r0=306(x), r1=185(y), r2=22(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 185
LDI r2, 22
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
