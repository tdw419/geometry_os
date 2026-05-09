; DESCRIPTION: Renders a red box of size 39x64 starting at (300, 42).
; PLAN: r0=300(x), r1=42(y), r2=39(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 42
LDI r2, 39
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
