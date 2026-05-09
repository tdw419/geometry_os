; DESCRIPTION: Renders a green box of size 98x87 starting at (116, 45).
; PLAN: r0=116(x), r1=45(y), r2=98(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 45
LDI r2, 98
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
