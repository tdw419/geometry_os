; DESCRIPTION: Renders a cyan box of size 50x16 starting at (26, 50).
; PLAN: r0=26(x), r1=50(y), r2=50(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 50
LDI r2, 50
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
