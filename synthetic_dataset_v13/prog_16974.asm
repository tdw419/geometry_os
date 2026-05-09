; DESCRIPTION: Renders a cyan box of size 101x92 starting at (224, 61).
; PLAN: r0=224(x), r1=61(y), r2=101(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 61
LDI r2, 101
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
