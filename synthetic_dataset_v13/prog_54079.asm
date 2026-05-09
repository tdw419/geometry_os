; DESCRIPTION: Renders a cyan box of size 26x85 starting at (462, 146).
; PLAN: r0=462(x), r1=146(y), r2=26(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 146
LDI r2, 26
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
