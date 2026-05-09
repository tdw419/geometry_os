; DESCRIPTION: Renders a cyan box of size 59x62 starting at (443, 104).
; PLAN: r0=443(x), r1=104(y), r2=59(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 104
LDI r2, 59
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
