; DESCRIPTION: Renders a cyan box of size 54x19 starting at (268, 159).
; PLAN: r0=268(x), r1=159(y), r2=54(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 159
LDI r2, 54
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
