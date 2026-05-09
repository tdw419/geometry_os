; DESCRIPTION: Renders a cyan box of size 35x103 starting at (399, 95).
; PLAN: r0=399(x), r1=95(y), r2=35(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 95
LDI r2, 35
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
