; DESCRIPTION: Renders a cyan box of size 30x18 starting at (423, 224).
; PLAN: r0=423(x), r1=224(y), r2=30(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 224
LDI r2, 30
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
