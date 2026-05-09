; DESCRIPTION: Renders a cyan box of size 111x117 starting at (116, 95).
; PLAN: r0=116(x), r1=95(y), r2=111(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 95
LDI r2, 111
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
