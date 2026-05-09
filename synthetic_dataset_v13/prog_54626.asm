; DESCRIPTION: Renders a cyan box of size 120x62 starting at (34, 157).
; PLAN: r0=34(x), r1=157(y), r2=120(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 157
LDI r2, 120
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
