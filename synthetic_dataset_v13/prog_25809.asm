; DESCRIPTION: Renders a yellow box of size 82x64 starting at (74, 95).
; PLAN: r0=74(x), r1=95(y), r2=82(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 95
LDI r2, 82
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
