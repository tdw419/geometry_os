; DESCRIPTION: Renders a green box of size 15x64 starting at (376, 143).
; PLAN: r0=376(x), r1=143(y), r2=15(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 143
LDI r2, 15
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
