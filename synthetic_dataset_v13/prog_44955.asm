; DESCRIPTION: Renders a cyan box of size 11x43 starting at (379, 86).
; PLAN: r0=379(x), r1=86(y), r2=11(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 86
LDI r2, 11
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
