; DESCRIPTION: Renders a cyan box of size 72x119 starting at (309, 86).
; PLAN: r0=309(x), r1=86(y), r2=72(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 86
LDI r2, 72
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
