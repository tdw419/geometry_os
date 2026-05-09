; DESCRIPTION: Renders a cyan box of size 110x26 starting at (172, 197).
; PLAN: r0=172(x), r1=197(y), r2=110(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 197
LDI r2, 110
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
