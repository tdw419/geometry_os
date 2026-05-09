; DESCRIPTION: Renders a cyan box of size 13x26 starting at (374, 83).
; PLAN: r0=374(x), r1=83(y), r2=13(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 83
LDI r2, 13
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
