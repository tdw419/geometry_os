; DESCRIPTION: Renders a cyan box of size 111x62 starting at (227, 47).
; PLAN: r0=227(x), r1=47(y), r2=111(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 47
LDI r2, 111
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
