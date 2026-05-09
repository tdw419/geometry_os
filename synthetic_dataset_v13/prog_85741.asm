; DESCRIPTION: Renders a cyan box of size 48x105 starting at (263, 64).
; PLAN: r0=263(x), r1=64(y), r2=48(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 64
LDI r2, 48
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
