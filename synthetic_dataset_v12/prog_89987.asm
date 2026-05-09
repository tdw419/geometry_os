; DESCRIPTION: Composite: Renders a cyan box of size 88x61 starting at (61, 150) then Places a yellow dot at position (231, 69).
; PLAN: r0=61(x), r1=150(y), r2=88(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=231(x), r6=69(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 61
LDI r1, 150
LDI r2, 88
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 231
LDI r6, 69
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
