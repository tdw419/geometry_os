; DESCRIPTION: Renders a cyan box of size 90x62 starting at (1, 37).
; PLAN: r0=1(x), r1=37(y), r2=90(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 37
LDI r2, 90
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
