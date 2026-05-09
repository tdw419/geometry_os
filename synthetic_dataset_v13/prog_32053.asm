; DESCRIPTION: Renders a cyan box of size 75x14 starting at (97, 50).
; PLAN: r0=97(x), r1=50(y), r2=75(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 50
LDI r2, 75
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
