; DESCRIPTION: Renders a cyan box of size 116x24 starting at (224, 2).
; PLAN: r0=224(x), r1=2(y), r2=116(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 2
LDI r2, 116
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
