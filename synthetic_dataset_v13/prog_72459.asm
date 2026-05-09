; DESCRIPTION: Renders a cyan box of size 91x23 starting at (309, 28).
; PLAN: r0=309(x), r1=28(y), r2=91(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 28
LDI r2, 91
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
