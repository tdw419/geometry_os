; DESCRIPTION: Renders a cyan box of size 78x108 starting at (252, 111).
; PLAN: r0=252(x), r1=111(y), r2=78(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 111
LDI r2, 78
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
