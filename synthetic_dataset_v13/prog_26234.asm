; DESCRIPTION: Renders a cyan box of size 12x83 starting at (492, 161).
; PLAN: r0=492(x), r1=161(y), r2=12(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 161
LDI r2, 12
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
