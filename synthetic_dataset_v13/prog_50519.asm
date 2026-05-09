; DESCRIPTION: Renders a cyan box of size 78x62 starting at (66, 103).
; PLAN: r0=66(x), r1=103(y), r2=78(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 103
LDI r2, 78
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
