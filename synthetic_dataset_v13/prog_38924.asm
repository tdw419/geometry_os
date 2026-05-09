; DESCRIPTION: Renders a cyan box of size 62x68 starting at (358, 76).
; PLAN: r0=358(x), r1=76(y), r2=62(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 76
LDI r2, 62
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
