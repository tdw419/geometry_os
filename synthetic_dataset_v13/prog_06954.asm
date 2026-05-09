; DESCRIPTION: Renders a cyan box of size 71x50 starting at (4, 178).
; PLAN: r0=4(x), r1=178(y), r2=71(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 178
LDI r2, 71
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
