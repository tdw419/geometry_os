; DESCRIPTION: Renders a cyan box of size 119x62 starting at (31, 146).
; PLAN: r0=31(x), r1=146(y), r2=119(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 146
LDI r2, 119
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
