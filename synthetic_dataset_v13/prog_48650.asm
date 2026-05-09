; DESCRIPTION: Renders a cyan box of size 14x66 starting at (443, 18).
; PLAN: r0=443(x), r1=18(y), r2=14(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 18
LDI r2, 14
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
