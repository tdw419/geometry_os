; DESCRIPTION: Renders a cyan box of size 83x68 starting at (4, 50).
; PLAN: r0=4(x), r1=50(y), r2=83(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 50
LDI r2, 83
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
