; DESCRIPTION: Renders a magenta box of size 35x16 starting at (295, 73).
; PLAN: r0=295(x), r1=73(y), r2=35(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 73
LDI r2, 35
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
