; DESCRIPTION: Renders a cyan box of size 71x95 starting at (200, 134).
; PLAN: r0=200(x), r1=134(y), r2=71(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 134
LDI r2, 71
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
