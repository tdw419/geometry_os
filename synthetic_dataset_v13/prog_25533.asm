; DESCRIPTION: Renders a cyan box of size 100x112 starting at (113, 128).
; PLAN: r0=113(x), r1=128(y), r2=100(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 128
LDI r2, 100
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
