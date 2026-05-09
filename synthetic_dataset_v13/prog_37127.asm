; DESCRIPTION: Renders a cyan box of size 113x63 starting at (41, 126).
; PLAN: r0=41(x), r1=126(y), r2=113(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 126
LDI r2, 113
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
