; DESCRIPTION: Renders a cyan box of size 87x45 starting at (66, 37).
; PLAN: r0=66(x), r1=37(y), r2=87(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 37
LDI r2, 87
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
