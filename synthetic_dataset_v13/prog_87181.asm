; DESCRIPTION: Renders a cyan box of size 120x100 starting at (144, 128).
; PLAN: r0=144(x), r1=128(y), r2=120(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 128
LDI r2, 120
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
