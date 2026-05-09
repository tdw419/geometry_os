; DESCRIPTION: Renders a cyan box of size 13x28 starting at (363, 48).
; PLAN: r0=363(x), r1=48(y), r2=13(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 48
LDI r2, 13
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
