; DESCRIPTION: Renders a cyan box of size 45x109 starting at (134, 83).
; PLAN: r0=134(x), r1=83(y), r2=45(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 83
LDI r2, 45
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
