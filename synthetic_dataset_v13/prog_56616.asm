; DESCRIPTION: Renders a cyan box of size 100x47 starting at (211, 167).
; PLAN: r0=211(x), r1=167(y), r2=100(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 167
LDI r2, 100
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
