; DESCRIPTION: Renders a cyan box of size 43x48 starting at (116, 93).
; PLAN: r0=116(x), r1=93(y), r2=43(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 93
LDI r2, 43
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
