; DESCRIPTION: Renders a cyan box of size 56x18 starting at (299, 48).
; PLAN: r0=299(x), r1=48(y), r2=56(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 48
LDI r2, 56
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
