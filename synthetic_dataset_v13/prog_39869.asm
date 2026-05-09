; DESCRIPTION: Renders a green box of size 27x45 starting at (365, 167).
; PLAN: r0=365(x), r1=167(y), r2=27(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 167
LDI r2, 27
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
