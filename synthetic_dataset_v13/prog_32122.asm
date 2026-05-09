; DESCRIPTION: Renders a cyan box of size 85x44 starting at (418, 205).
; PLAN: r0=418(x), r1=205(y), r2=85(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 205
LDI r2, 85
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
