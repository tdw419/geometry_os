; DESCRIPTION: Renders a cyan box of size 83x82 starting at (419, 9).
; PLAN: r0=419(x), r1=9(y), r2=83(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 9
LDI r2, 83
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
