; DESCRIPTION: Renders a cyan box of size 115x64 starting at (119, 28).
; PLAN: r0=119(x), r1=28(y), r2=115(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 28
LDI r2, 115
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
