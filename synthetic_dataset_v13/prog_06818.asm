; DESCRIPTION: Renders a cyan box of size 71x43 starting at (164, 159).
; PLAN: r0=164(x), r1=159(y), r2=71(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 159
LDI r2, 71
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
