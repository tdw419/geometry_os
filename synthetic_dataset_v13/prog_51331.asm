; DESCRIPTION: Renders a cyan box of size 97x83 starting at (214, 12).
; PLAN: r0=214(x), r1=12(y), r2=97(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 12
LDI r2, 97
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
