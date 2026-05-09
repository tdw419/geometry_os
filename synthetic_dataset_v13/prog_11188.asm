; DESCRIPTION: Renders a cyan box of size 109x26 starting at (197, 5).
; PLAN: r0=197(x), r1=5(y), r2=109(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 5
LDI r2, 109
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
